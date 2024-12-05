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
  passwordConfirmation(
    path: '/passwordConfirmation',
    name: 'passwordConfirmation',
  ),
  resetPassword(
    path: '/resetPassword',
    name: 'resetPassword',
  ),
  forgotPasswordSuccess(
    path: '/forgotPasswordSuccess',
    name: 'forgotPasswordSuccess',
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
  upcomingBookings(
    path: '/upcomingBookings',
    name: 'upcomingBookings',
  ),
  completedBookings(
    path: '/completedBookings',
    name: 'completedBookings',
  ),
  bookingDetails(
    path: '/bookingDetails',
    name: 'bookingDetails',
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
