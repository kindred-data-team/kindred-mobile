import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kindred_app/common/constants/assets.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.onboardingTwo,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 35,
        ),
        SizedBox(
          height: 150,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset(Assets.petalsLeft)),
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Text(
                  "Instantly chat with our\ncare team & doctors",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Louize",
                    color: AppColors.primaryColor,
                    fontSize: 28.px,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(Assets.petalsRight)),
            ],
          ),
        ),
      ],
    );
  }
}
