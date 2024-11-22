import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_mobile/common/theme/theme_colors.dart';
import 'package:kindred_mobile/features/onboarding/presentation/pages/screen_one.dart';
import 'package:kindred_mobile/features/onboarding/presentation/pages/screen_three.dart';
import 'package:kindred_mobile/features/onboarding/presentation/pages/screen_two.dart';
import 'package:kindred_mobile/features/onboarding/presentation/widgets/circular_arrow.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  List<Widget> container = [
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: container,
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              dotColor: AppColors.greyColor,
              activeDotColor: AppColors.greyColor,
              dotHeight: 12,
              dotWidth: 12,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (_currentPage > 0)
                TextButton(
                  onPressed: () {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const CircularArrowIcon(icon: Icons.arrow_back),
                ),
              if (_currentPage < 2)
                TextButton(
                  onPressed: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const CircularArrowIcon(icon: Icons.arrow_forward),
                ),
              if (_currentPage == 2)
                TextButton(
                  onPressed: () {
                    context.go('/authScreen');
                  },
                  child: Text(
                    "Let's Start!",
                    style: TextStyle(
                      fontFamily: "GTWalsheimPro",
                      color: AppColors.primaryColor,
                      fontSize: 23.px,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
