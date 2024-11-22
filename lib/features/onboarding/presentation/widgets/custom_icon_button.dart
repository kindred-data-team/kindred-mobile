import 'package:flutter/material.dart';
import 'package:kindred_mobile/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final Widget logo;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? padding;
  final double? spacing;

  const CustomIconButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.logo,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 180,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30.px),
              side: const BorderSide(color: AppColors.primaryColor)),
          padding: EdgeInsets.all(padding ?? 16.px),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            logo,
            SizedBox(width: spacing ?? 10),
            Text(
              text,
              style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontSize: 16.0,
                  fontFamily: "GTWalsheimPro"),
            ),
          ],
        ),
      ),
    );
  }
}
