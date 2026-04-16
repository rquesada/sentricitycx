import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/account_type/presentation/account_type_screen.dart';
import '../../features/student_register/presentation/student_register_screen.dart';

abstract final class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String accountType = '/account-type';
  static const String studentRegister = '/student-register';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.accountType,
      builder: (context, state) => const AccountTypeScreen(),
    ),
    GoRoute(
      path: AppRoutes.studentRegister,
      builder: (context, state) => const StudentRegisterScreen(),
    ),
  ],
);
