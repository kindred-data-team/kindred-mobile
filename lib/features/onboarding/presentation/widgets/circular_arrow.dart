import 'package:flutter/material.dart';
import 'package:kindred_mobile/common/theme/theme_colors.dart';

class CircularArrowIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final double? size;
  final Color? iconColor;
  final IconData icon;

  const CircularArrowIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    this.iconColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 60,
      height: height ?? 60,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: AppColors.secondaryColorOne),
      child: Center(
        child: Icon(
          icon,
          color: iconColor ?? AppColors.primaryColor,
          size: size ?? 40,
        ),
      ),
    );
  }
}
