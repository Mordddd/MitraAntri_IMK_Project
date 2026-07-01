import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/app_controller.dart';
import 'app/app_scope.dart';
import 'core/app_routes.dart';
import 'core/app_theme.dart';
<<<<<<< HEAD
import 'dummy/dummy_data.dart';
import 'models/hospital.dart';
import 'partner/partner_controller.dart';
import 'partner/partner_scope.dart';
import 'partner/screens/partner_active_order_screen.dart';
import 'partner/screens/partner_login_screen.dart';
import 'partner/screens/partner_settings_screen.dart';
import 'partner/screens/partner_shell_screen.dart';
import 'partner/screens/partner_statistics_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/culinary_service_screen.dart';
import 'screens/driver_chat_screen.dart';
import 'screens/driver_profile_screen.dart';
import 'screens/event_ticket_screen.dart';
import 'screens/fashion_service_screen.dart';
import 'screens/hospital_details_screen.dart';
import 'screens/hospital_list_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main_shell_screen.dart';
import 'screens/mitra_status_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/public_service_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tracking_screen.dart';
import 'screens/wallet_screen.dart';
=======
import 'data/dummy_data.dart';
import 'screens/booking_screen.dart';
import 'screens/home_screen.dart';
import 'screens/mitra_dashboard_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/tracking_screen.dart';
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5

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
<<<<<<< HEAD
  late final PartnerController _partnerController;
=======
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    _controller = AppController(
      initialOrder: DummyData.order,
      wallet: DummyData.wallet,
    );
    _partnerController = PartnerController();
=======
    _controller = AppController(initialOrder: DummyData.order);
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
  }

  @override
  void dispose() {
    _controller.dispose();
<<<<<<< HEAD
    _partnerController.dispose();
=======
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      controller: _controller,
<<<<<<< HEAD
      child: PartnerScope(
        controller: _partnerController,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MitraAntri',
          theme: AppTheme.light(),
          locale: const Locale('id', 'ID'),
          supportedLocales: const [Locale('id', 'ID')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: AppRoutes.splash,
          onGenerateRoute: _onGenerateRoute,
        ),
=======
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
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
      ),
    );
  }

  Route<void> _onGenerateRoute(RouteSettings settings) {
<<<<<<< HEAD
    final requested = settings.name ?? AppRoutes.splash;
    final isPartner = _controller.role == AppRole.partner;
    final tabIndex = settings.arguments is int ? settings.arguments as int : 0;

    final Widget screen = switch (requested) {
      AppRoutes.splash => const SplashScreen(),
      AppRoutes.login => const LoginScreen(),
      AppRoutes.main => MainShellScreen(initialIndex: tabIndex),
      AppRoutes.onboarding => const OnboardingScreen(),
      AppRoutes.dashboard when isPartner => const PartnerLoginScreen(),
      AppRoutes.partnerLogin => const PartnerLoginScreen(),
      AppRoutes.partnerMain => PartnerShellScreen(initialIndex: tabIndex),
      AppRoutes.partnerActiveOrder => const PartnerActiveOrderScreen(),
      AppRoutes.partnerSettings => const PartnerSettingsScreen(),
      AppRoutes.partnerStatistics => const PartnerStatisticsScreen(),
      AppRoutes.home when !isPartner => const MainShellScreen(),
      AppRoutes.booking when !isPartner => const BookingScreen(),
      AppRoutes.tracking when !isPartner => const TrackingScreen(),
      AppRoutes.payment when !isPartner => const PaymentScreen(),
      AppRoutes.hospitalList => const HospitalListScreen(),
      AppRoutes.hospitalDetails => HospitalDetailsScreen(
          hospital: settings.arguments as Hospital,
        ),
      AppRoutes.fashionService => const FashionServiceScreen(),
      AppRoutes.culinaryService => const CulinaryServiceScreen(),
      AppRoutes.publicService => const PublicServiceScreen(),
      AppRoutes.eventTickets => const EventTicketScreen(),
      AppRoutes.wallet => const WalletScreen(),
      AppRoutes.profile => const ProfileScreen(),
      AppRoutes.driverProfile => const DriverProfileScreen(),
      AppRoutes.driverChat => const DriverChatScreen(),
      AppRoutes.mitraStatus => const MitraStatusScreen(),
      _ when isPartner => _partnerController.isLoggedIn
          ? const PartnerShellScreen()
          : const PartnerLoginScreen(),
      _ => const SplashScreen(),
=======
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
>>>>>>> e779af82024cf7b88993b7a681383685aaa57ba5
    };

    return MaterialPageRoute<void>(
      builder: (_) => screen,
      settings: settings,
    );
  }
}
