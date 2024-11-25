import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:kindred_app/core/presentation/widgets/custom_button.dart';
import 'package:kindred_app/core/presentation/widgets/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            height: 120,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Sign In",
              style: TextStyle(fontSize: 28.px),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          CustomTextField(
            labelText: "Email",
            hintText: "Email",
            controller: emailController,
            obscureText: false,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            labelText: "Password",
            hintText: "Password",
            controller: passwordController,
            obscureText: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                context.go('/forgotPasswordConfirmationScreen');
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 12.px, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(label: "Log In", onPressed: () {}),
          const Spacer(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 13.px,
              ),
              children: <TextSpan>[
                const TextSpan(
                    text: "Don’t have an account?",
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: " Sign Up",
                    recognizer: TapGestureRecognizer()..onTap = () async {},
                    style: const TextStyle(color: AppColors.primaryColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
