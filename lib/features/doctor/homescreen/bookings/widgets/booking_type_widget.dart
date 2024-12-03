import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';

class BookingTypeWidget extends StatelessWidget {
  final Widget? child;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxShadow? boxShadow;

  const BookingTypeWidget({
    super.key,
    this.child,
    this.color = AppColors.primaryColor,
    this.padding,
    this.margin,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      height: 40.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(child: child),
    );
  }
}
