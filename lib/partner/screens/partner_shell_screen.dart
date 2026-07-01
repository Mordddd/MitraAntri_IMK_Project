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

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
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
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: PartnerBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
