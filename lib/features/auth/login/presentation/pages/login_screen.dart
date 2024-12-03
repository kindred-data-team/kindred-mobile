import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:kindred_app/core/presentation/widgets/custom_textfield.dart';
import 'package:kindred_app/core/presentation/widgets/default_button.dart';
import 'package:kindred_app/features/auth/bloc/auth_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late AuthBloc _authBloc;
  @override
  void initState() {
    _authBloc = AuthBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: Scaffold(
        body: Center(
          child: _buildBody(context),
        ),
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
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoginSuccess) {
                //Navigate to home
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login Successful: ${state.message}')),
                );
              }
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login Failed: ${state.error}')),
                );
              }
            },
            builder: (context, state) {
              return GlobalButton(
                  label: "Log In",
                  onPressed: () {
                    _authBloc.add(UserLoginEvent(email: emailController.text, password: passwordController.text));
                  });
            },
          ),
          const Spacer(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 13.px,
              ),
              children: <TextSpan>[
                const TextSpan(text: "Don’t have an account?", style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: " Sign Up",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.go('/registrationScreen');
                      },
                    style: const TextStyle(color: AppColors.primaryColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
