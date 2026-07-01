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

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  static const _tabs = [
    BottomNavItem(icon: Icons.home_rounded, label: 'Home'),
    BottomNavItem(icon: Icons.receipt_long_rounded, label: 'Orders'),
    BottomNavItem(icon: Icons.account_balance_wallet_rounded, label: 'Wallet'),
    BottomNavItem(icon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
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
        onTap: (index) => setState(() => _currentIndex = index),
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
