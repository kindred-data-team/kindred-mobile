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
