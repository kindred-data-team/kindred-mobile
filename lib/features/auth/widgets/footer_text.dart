import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FooterText extends StatelessWidget {
  final String plainText;
  final TextStyle? plainTextStyle;
  final String linkText;
  final TextStyle? linkTextStyle;
  final VoidCallback onLinkTap;
  final TextAlign textAlign;

  const FooterText({
    super.key,
    required this.plainText,
    this.plainTextStyle,
    required this.linkText,
    this.linkTextStyle,
    required this.onLinkTap,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: plainTextStyle ?? TextStyle(fontSize: 13.px, color: Colors.black),
        children: <TextSpan>[
          TextSpan(text: plainText, style: plainTextStyle),
          TextSpan(
            text: linkText,
            recognizer: TapGestureRecognizer()..onTap = onLinkTap,
            style: linkTextStyle ??
                TextStyle(
                  fontSize: 13.px,
                  color: AppColors.primaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
