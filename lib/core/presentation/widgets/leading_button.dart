import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_mobile/common/theme/theme_colors.dart';

class LeadingButton extends StatefulWidget {
  const LeadingButton({super.key});

  @override
  State<LeadingButton> createState() => LeadingButtonState();
}

class LeadingButtonState extends State<LeadingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.secondaryColorOne),
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Icon(
            size: 20,
            Icons.arrow_back_ios_new_sharp,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
