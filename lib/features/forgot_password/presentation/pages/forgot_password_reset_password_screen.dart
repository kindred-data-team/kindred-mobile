import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_mobile/core/presentation/widgets/custom_button.dart';
import 'package:kindred_mobile/core/presentation/widgets/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPasswordResetPasswordScreen extends StatefulWidget {
  const ForgotPasswordResetPasswordScreen({super.key});

  @override
  State<ForgotPasswordResetPasswordScreen> createState() =>
      _ForgotPasswordResetPasswordScreenState();
}

class _ForgotPasswordResetPasswordScreenState
    extends State<ForgotPasswordResetPasswordScreen> {
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

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
              "Reset Password",
              style: TextStyle(fontSize: 28.px),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            labelText: "New Password",
            hintText: "New Password",
            controller: newPassController,
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            labelText: "Confirm Password",
            hintText: "Confirm Password",
            controller: confirmPassController,
            obscureText: false,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
              label: "Submit",
              onPressed: () {
                context.go('/forgotPasswordSuccessScreen');
              }),
        ],
      ),
    );
  }
}
