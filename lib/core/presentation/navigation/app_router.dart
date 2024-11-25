import 'package:go_router/go_router.dart';
import 'package:kindred_mobile/common/constants/routes.dart';
import 'package:kindred_mobile/features/auth/presentation/auth_screen.dart';
import 'package:kindred_mobile/features/forgot_password/presentation/pages/forgot_password_confirmation_screen.dart';
import 'package:kindred_mobile/features/forgot_password/presentation/pages/forgot_password_reset_password_screen.dart';
import 'package:kindred_mobile/features/forgot_password/presentation/pages/forgot_password_success_screen.dart';
import 'package:kindred_mobile/features/login/presentation/pages/login_screen.dart';
import 'package:kindred_mobile/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:kindred_mobile/features/products/presentation/pages/product_list_page.dart';

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
  ]);
}
