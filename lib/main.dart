import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/app_controller.dart';
import 'app/app_scope.dart';
import 'core/app_routes.dart';
import 'core/app_theme.dart';
import 'data/dummy_data.dart';
import 'screens/booking_screen.dart';
import 'screens/home_screen.dart';
import 'screens/mitra_dashboard_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/tracking_screen.dart';

void main() {
  runApp(const MitraAntriApp());
}

class MitraAntriApp extends StatefulWidget {
  const MitraAntriApp({super.key});

  @override
  State<MitraAntriApp> createState() => _MitraAntriAppState();
}

class _MitraAntriAppState extends State<MitraAntriApp> {
  late final AppController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AppController(initialOrder: DummyData.order);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      controller: _controller,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mitra Antri',
        theme: AppTheme.light(),
        locale: const Locale('id', 'ID'),
        supportedLocales: const [Locale('id', 'ID')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: AppRoutes.onboarding,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route<void> _onGenerateRoute(RouteSettings settings) {
    final requested = settings.name ?? AppRoutes.onboarding;
    final isPartner = _controller.role == AppRole.partner;

    final Widget screen = switch (requested) {
      AppRoutes.onboarding => const OnboardingScreen(),
      AppRoutes.dashboard when isPartner => const MitraDashboardScreen(),
      AppRoutes.home when !isPartner => const HomeScreen(),
      AppRoutes.booking when !isPartner => const BookingScreen(),
      AppRoutes.tracking when !isPartner => const TrackingScreen(),
      AppRoutes.payment when !isPartner => const PaymentScreen(),
      _ when isPartner => const MitraDashboardScreen(),
      _ => const OnboardingScreen(),
    };

    return MaterialPageRoute<void>(
      builder: (_) => screen,
      settings: settings,
    );
  }
}
