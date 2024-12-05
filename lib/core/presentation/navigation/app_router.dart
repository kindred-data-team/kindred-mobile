import 'package:go_router/go_router.dart';
import 'package:kindred_app/common/constants/routes.dart';
import 'package:kindred_app/features/auth/forgot_password/presentation/pages/forgot_password_success.dart';
import 'package:kindred_app/features/auth/forgot_password/presentation/pages/password_confirmation.dart';
import 'package:kindred_app/features/auth/forgot_password/presentation/pages/reset_password.dart';
import 'package:kindred_app/features/auth/login/presentation/pages/login_screen.dart';
import 'package:kindred_app/features/auth/presentation/auth_screen.dart';
import 'package:kindred_app/features/auth/register/presentation/pages/registration_screen.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/pages/booking_details.dart';
import 'package:kindred_app/features/doctor/homescreen/bookings/pages/bookings_screen.dart';
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
        routes: <RouteBase>[
          GoRoute(
            name: Routes.authScreen.name,
            path: Routes.authScreen.path,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AuthScreen(), // temp
            ),
          ),
        ]),

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
      name: Routes.passwordConfirmation.name,
      path: Routes.passwordConfirmation.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: PasswordConfirmation(),
      ),
    ),
    GoRoute(
      name: Routes.resetPassword.name,
      path: Routes.resetPassword.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: ResetPassword(),
      ),
    ),
    GoRoute(
      name: Routes.forgotPasswordSuccess.name,
      path: Routes.forgotPasswordSuccess.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: ForgotPasswordSuccess(),
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
      name: Routes.bookingDetails.name,
      path: Routes.bookingDetails.addParams('productId'),
      pageBuilder: (context, state) => NoTransitionPage(
        child: BookingDetails(
          name: state.pathParameters['name'] ?? "",
          consultationType: state.pathParameters['consultationType'] ?? "",
          time: state.pathParameters['time'] ?? "",
        ),
      ),
    ),
  ]);
}
