import 'package:go_router/go_router.dart';
import 'package:kindred_app/common/constants/routes.dart';
import 'package:kindred_app/features/auth/forgot_password/presentation/pages/forgot_password_confirmation_screen.dart';
import 'package:kindred_app/features/auth/forgot_password/presentation/pages/forgot_password_reset_password_screen.dart';
import 'package:kindred_app/features/auth/forgot_password/presentation/pages/forgot_password_success_screen.dart';
import 'package:kindred_app/features/auth/login/presentation/pages/login_screen.dart';
import 'package:kindred_app/features/auth/presentation/auth_screen.dart';
import 'package:kindred_app/features/auth/register/presentation/pages/registration_screen.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/pages/bookings_screen.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/pages/details_screen.dart';
import 'package:kindred_app/features/doctor/homescreen/presentation/pages/homepage.dart';
import 'package:kindred_app/features/doctor/homescreen/presentation/pages/homescreen.dart';
import 'package:kindred_app/features/doctor/homescreen/presentation/pages/notification_screen.dart';
import 'package:kindred_app/features/onboarding/presentation/pages/onboarding_screen.dart';

class AppRouter {
  AppRouter();

  static final goRouter = GoRouter(initialLocation: Routes.onboardingScreen.path, routes: [
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
    //  GoRoute(
    //   name: Routes.authScreen.name,
    //   path: Routes.authScreen.path,
    //   pageBuilder: (context, state) => const NoTransitionPage(
    //     child: AuthScreen(), // temp
    //   ),
    //   routes: <RouteBase>[
    //     GoRoute(
    //       path: Routes.loginScreen.path,
    //       name: Routes.loginScreen.name,
    //       pageBuilder: (context, state) => const NoTransitionPage(
    //         child: LoginScreen(),
    //       ),
    //     ),
    //     GoRoute(
    //       name: Routes.forgotPasswordConfirmationScreen.name,
    //       path: Routes.forgotPasswordConfirmationScreen.path,
    //       pageBuilder: (context, state) => const NoTransitionPage(
    //         child: ForgotPasswordConfirmationScreen(),
    //       ),
    //     ),
    //     GoRoute(
    //       name: Routes.forgotPasswordResetPasswordScreen.name,
    //       path: Routes.forgotPasswordResetPasswordScreen.path,
    //       pageBuilder: (context, state) => const NoTransitionPage(
    //         child: ForgotPasswordResetPasswordScreen(),
    //       ),
    //     ),
    //     GoRoute(
    //       name: Routes.forgotPasswordSuccessScreen.name,
    //       path: Routes.forgotPasswordSuccessScreen.path,
    //       pageBuilder: (context, state) => const NoTransitionPage(
    //         child: ForgotPasswordSuccessScreen(),
    //       ),
    //     ),
    //     GoRoute(
    //       name: Routes.registrationScreen.name,
    //       path: Routes.registrationScreen.path,
    //       pageBuilder: (context, state) => const NoTransitionPage(
    //         child: RegistrationScreen(),
    //       ),
    //     ),
    //   ],
    // ),
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
    GoRoute(
      name: Routes.homeScreen.name,
      path: Routes.homeScreen.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      name: Routes.homePage.name,
      path: Routes.homePage.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: HomePage(),
      ),
    ),
    GoRoute(
      name: Routes.notificationScreen.name,
      path: Routes.notificationScreen.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: NotificationScreen(),
      ),
    ),
    GoRoute(
      name: Routes.bookingsScreen.name,
      path: Routes.bookingsScreen.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: BookingsScreen(),
      ),
    ),
    GoRoute(
      name: Routes.detailsScreen.name,
      path: Routes.detailsScreen.addParams('productId'),
      pageBuilder: (context, state) => NoTransitionPage(
        child: DetailScreen(
          name: state.pathParameters['name'] ?? "",
          consultationType: state.pathParameters['consultationType'] ?? "",
          time: state.pathParameters['time'] ?? "",
        ),
      ),
    ),
  ]);
}
