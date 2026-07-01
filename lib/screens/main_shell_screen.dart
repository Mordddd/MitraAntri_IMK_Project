import 'package:flutter/material.dart';

import '../core/app_routes.dart';
import '../widgets/bottom_nav.dart';
import 'home_screen.dart';
import 'order_history_screen.dart';
import 'profile_screen.dart';
import 'wallet_screen.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  late int _currentIndex;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, _tabs.length - 1);
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static const _tabs = [
    BottomNavItem(icon: Icons.home_rounded, label: 'Beranda'),
    BottomNavItem(icon: Icons.receipt_long_rounded, label: 'Pesanan'),
    BottomNavItem(icon: Icons.account_balance_wallet_rounded, label: 'Dompet'),
    BottomNavItem(icon: Icons.person_rounded, label: 'Profil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: const [
          HomeScreen(),
          OrderHistoryScreen(showBackButton: false),
          WalletScreen(showBackButton: false),
          ProfileScreen(showBackButton: false),
        ],
      ),
      bottomNavigationBar: MockBottomNav(
        currentIndex: _currentIndex,
        items: _tabs,
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

void navigateToMainTab(BuildContext context, int index) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    AppRoutes.main,
    (_) => false,
    arguments: index,
  );
}
