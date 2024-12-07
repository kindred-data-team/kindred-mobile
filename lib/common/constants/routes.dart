enum Routes {
  home(
    path: '/',
    name: 'home',
  ),
  authScreen(
    path: '/authScreen',
    name: 'authScreen',
  ),
  onboardingScreen(
    path: '/onboardingScreen',
    name: 'onboardingScreen',
  ),
  loginScreen(
    path: '/loginScreen',
    name: 'loginScreen',
  ),
  forgotPasswordConfirmationScreen(
    path: '/forgotPasswordConfirmationScreen',
    name: 'forgotPasswordConfirmationScreen',
  ),
  forgotPasswordResetPasswordScreen(
    path: '/forgotPasswordResetPasswordScreen',
    name: 'forgotPasswordResetPasswordScreen',
  ),
  forgotPasswordSuccessScreen(
    path: '/forgotPasswordSuccessScreen',
    name: 'forgotPasswordSuccessScreen',
  ),
  registrationScreen(
    path: '/registrationScreen',
    name: 'registrationScreen',
  ),
  homeScreen(
    path: '/homeScreen',
    name: 'homeScreen',
  ),
  homePage(
    path: '/homePage',
    name: 'homePage',
  ),
  notificationScreen(
    path: '/notificationScreen',
    name: 'notificationScreen',
  ),
  bookingsScreen(
    path: '/bookingsScreen',
    name: 'bookingsScreen',
  ),
  upcomingScreen(
    path: '/upcomingScreen',
    name: 'upcomingScreen',
  ),
  completedScreen(
    path: '/completedScreen',
    name: 'completedScreen',
  ),
  detailsScreen(
    path: '/detailsScreen',
    name: 'detailsScreen',
  ),
  productViewPage(path: '/product', name: 'product');

  final String path;
  final String name;

  const Routes({
    required this.path,
    required this.name,
  });

  String asSubPath() => path.replaceAll('/', '');

  String addParams(String? params) => '$path/:$params';
}
