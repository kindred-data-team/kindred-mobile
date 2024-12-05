import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GlobalButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  bool? isLoading;

  GlobalButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.px),
          ),
        ),
        onPressed: onPressed,
        child: isLoading ?? false
            ? SizedBox(
                height: 16.px,
                width: 16.px,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ))
            : Text(
                label,
                style: TextStyle(fontSize: 16.px),
              ),
      ),
    );
  }
}
