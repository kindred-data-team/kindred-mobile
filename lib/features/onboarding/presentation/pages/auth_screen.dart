import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kindred_mobile/common/constants/image_constants.dart';
import 'package:kindred_mobile/common/theme/theme_colors.dart';
import 'package:kindred_mobile/features/onboarding/presentation/widgets/custom_icon_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImage.authOnboarding,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 40),
        Text(
          "Continue with",
          style: TextStyle(
            fontFamily: "GTWalsheimPro",
            color: Colors.black,
            fontSize: 14.px,
          ),
        ),
        const SizedBox(height: 30),
        // Custom buttons
        CustomIconButton(
          text: "Google",
          logo: Image.asset(AppImage.googleLogo),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        CustomIconButton(
          text: "Apple",
          logo: Image.asset(AppImage.appleLogo),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        CustomIconButton(
          text: "Email",
          logo: Image.asset(AppImage.emailLogo),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontFamily: "GTWalsheimPro",
                fontSize: 13.px,
              ),
              children: <TextSpan>[
                const TextSpan(
                    text: "By signing up, you agree to our",
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: " Terms & Conditions",
                    recognizer: TapGestureRecognizer()..onTap = () async {},
                    style: const TextStyle(color: AppColors.primaryColor)),
                const TextSpan(
                    text: " and", style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: " Privacy Policy",
                    recognizer: TapGestureRecognizer()..onTap = () async {},
                    style: const TextStyle(color: AppColors.primaryColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}