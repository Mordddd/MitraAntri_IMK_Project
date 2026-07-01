import 'package:flutter/material.dart';

import '../widgets/partner_bottom_nav.dart';
import 'partner_home_screen.dart';
import 'partner_notifications_screen.dart';
import 'partner_orders_screen.dart';
import 'partner_profile_screen.dart';
import 'partner_wallet_screen.dart';

class PartnerShellScreen extends StatefulWidget {
  const PartnerShellScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<PartnerShellScreen> createState() => _PartnerShellScreenState();
}

class _PartnerShellScreenState extends State<PartnerShellScreen> {
  late int _currentIndex;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, 4);
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const PartnerHomeScreen(),
      const PartnerOrdersScreen(),
      const PartnerWalletScreen(),
      const PartnerNotificationsScreen(),
      const PartnerProfileScreen(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: screens,
      ),
      bottomNavigationBar: PartnerBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex) return;
          if (MediaQuery.disableAnimationsOf(context)) {
            _pageController.jumpToPage(index);
            return;
          }
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeOutQuart,
          );
        },
      ),
    );
  }
}
