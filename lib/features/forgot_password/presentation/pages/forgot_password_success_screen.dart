import 'package:flutter/material.dart';
import 'package:kindred_app/core/presentation/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPasswordSuccessScreen extends StatelessWidget {
  const ForgotPasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Password changed, successfully!",
              style: TextStyle(fontSize: 28.px),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(label: "Go to Home", onPressed: () {}),
        ],
      ),
    );
  }
}
