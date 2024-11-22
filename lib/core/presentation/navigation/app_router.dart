import 'package:go_router/go_router.dart';
import 'package:kindred_mobile/common/constants/routes.dart';
import 'package:kindred_mobile/features/onboarding/presentation/pages/auth_screen.dart';
import 'package:kindred_mobile/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:kindred_mobile/features/onboarding/presentation/pages/screen_one.dart';
import 'package:kindred_mobile/features/products/presentation/pages/product_list_page.dart';
import 'package:kindred_mobile/features/products/presentation/pages/singe_product_page.dart';

class AppRouter {
  AppRouter();
  static final goRouter = GoRouter(initialLocation: Routes.onboardingScreen.path, routes: [
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
      name: Routes.productViewPage.name,
      path: Routes.productViewPage.addParams('productId'),
      pageBuilder: (context, state) => NoTransitionPage(
        child: SingleProductPage(
          id: int.parse(state.pathParameters['productId'] ?? ''),
        ),
      ),
    ),
  ]);
}

