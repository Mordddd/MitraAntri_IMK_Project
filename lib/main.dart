import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/app_controller.dart';
import 'app/app_scope.dart';
import 'core/app_routes.dart';
import 'core/app_theme.dart';
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
  late final PartnerController _partnerController;

  @override
  void initState() {
    super.initState();
    _controller = AppController(
      initialOrder: DummyData.order,
      wallet: DummyData.wallet,
    );
    _partnerController = PartnerController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _partnerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      controller: _controller,
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
      ),
    );
  }

  Route<void> _onGenerateRoute(RouteSettings settings) {
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
      AppRoutes.hospitalDetails when settings.arguments is Hospital =>
        HospitalDetailsScreen(hospital: settings.arguments as Hospital),
      AppRoutes.hospitalDetails => const HospitalListScreen(),
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
    };

    return PageRouteBuilder<void>(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 320),
      reverseTransitionDuration: const Duration(milliseconds: 240),
      pageBuilder: (_, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (MediaQuery.disableAnimationsOf(context)) return child;
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.04, 0.02),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}
