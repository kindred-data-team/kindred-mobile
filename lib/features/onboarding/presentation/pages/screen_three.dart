import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kindred_mobile/common/constants/image_constants.dart';
import 'package:kindred_mobile/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

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
          AppImage.onboardingThree,
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
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Text(
                  "Easily access your\nprescriptions &\nmedical history",
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
                  child: SvgPicture.asset(AppImage.petalsRight)),
            ],
          ),
        ),
      ],
    );
  }
}