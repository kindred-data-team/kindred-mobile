import 'package:go_router/go_router.dart';
import 'package:kindred_app/common/constants/routes.dart';
import 'package:kindred_app/features/auth/forgot_password/presentation/pages/forgot_password_confirmation_screen.dart';
import 'package:kindred_app/features/auth/forgot_password/presentation/pages/forgot_password_reset_password_screen.dart';
import 'package:kindred_app/features/auth/forgot_password/presentation/pages/forgot_password_success_screen.dart';
import 'package:kindred_app/features/auth/login/presentation/pages/login_screen.dart';
import 'package:kindred_app/features/auth/presentation/auth_screen.dart';
import 'package:kindred_app/features/auth/register/presentation/pages/registration_screen.dart';
import 'package:kindred_app/features/doctor/products/presentation/pages/product_list_page.dart';
import 'package:kindred_app/features/onboarding/presentation/pages/onboarding_screen.dart';

class AppRouter {
  AppRouter();

  static final goRouter =
      GoRouter(initialLocation: Routes.onboardingScreen.path, routes: [
    GoRoute(
      name: Routes.home.name,
      path: Routes.home.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: ProductListPage(),
      ),
    ),
    GoRoute(
      name: Routes.onboardingScreen.name,
      path: Routes.onboardingScreen.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: OnboardingPage(),
      ),
    ),
    GoRoute(
      name: Routes.authScreen.name,
      path: Routes.authScreen.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AuthScreen(), // temp
      ),
    ),
    GoRoute(
      name: Routes.loginScreen.name,
      path: Routes.loginScreen.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      name: Routes.forgotPasswordConfirmationScreen.name,
      path: Routes.forgotPasswordConfirmationScreen.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: ForgotPasswordConfirmationScreen(),
      ),
    ),
    GoRoute(
      name: Routes.forgotPasswordResetPasswordScreen.name,
      path: Routes.forgotPasswordResetPasswordScreen.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: ForgotPasswordResetPasswordScreen(),
      ),
    ),
    GoRoute(
      name: Routes.forgotPasswordSuccessScreen.name,
      path: Routes.forgotPasswordSuccessScreen.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: ForgotPasswordSuccessScreen(),
      ),
    ),
    GoRoute(
      name: Routes.registrationScreen.name,
      path: Routes.registrationScreen.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: RegistrationScreen(),
      ),
    ),
  ]);
}
