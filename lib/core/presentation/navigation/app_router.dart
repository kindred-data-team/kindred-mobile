import 'package:go_router/go_router.dart';
import 'package:kindred_mobile/common/constants/routes.dart';
import 'package:kindred_mobile/features/products/presentation/pages/product_list_page.dart';
import 'package:kindred_mobile/features/products/presentation/pages/singe_product_page.dart';

class AppRouter {
  AppRouter();
  static final goRouter = GoRouter(initialLocation: Routes.home.path, routes: [
    GoRoute(
      name: Routes.home.name,
      path: Routes.home.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: ProductListPage(),
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
