import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_app/common/constants/routes.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:kindred_app/core/presentation/widgets/custom_textfield.dart';
import 'package:kindred_app/core/presentation/widgets/default_button.dart';
import 'package:kindred_app/features/auth/bloc/auth_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
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
            height: 100,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 28.px),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          CustomTextField(
            labelText: "First Name",
            hintText: "First Name",
            controller: firstName,
            obscureText: false,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            labelText: "Last Name",
            hintText: "Last Name",
            controller: lastName,
            obscureText: false,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            labelText: "Email",
            hintText: "Email",
            controller: email,
            obscureText: false,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            labelText: "Password",
            hintText: "Password",
            controller: password,
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            labelText: "Confirm Password",
            hintText: "Confirm Password",
            controller: confirmPassword,
            obscureText: false,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 40, right: 30, bottom: 40),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 11.px,
                ),
                children: <TextSpan>[
                  const TextSpan(text: "By signing up, you agree to our", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: " Terms & Conditions",
                      recognizer: TapGestureRecognizer()..onTap = () async {},
                      style: const TextStyle(color: AppColors.primaryColor)),
                  const TextSpan(text: " and", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: " Privacy Policy",
                      recognizer: TapGestureRecognizer()..onTap = () async {},
                      style: const TextStyle(color: AppColors.primaryColor)),
                ],
              ),
            ),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthRegisterSuccess) {
                //Navigate to home
                context.go(Routes.homeScreen.path);
              }
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Register Failed: ${state.error}')),
                );
              }
            },
            builder: (context, state) {
              return GlobalButton(
                  label: "Create an account",
                  onPressed: () {
                    _authBloc.add(UserRegisterEvent(
                        firstName: firstName.text,
                        lastName: lastName.text,
                        email: email.text,
                        password: password.text,
                        confirmPassword: confirmPassword.text));
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
                const TextSpan(text: "Already have an account?", style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: " Log In",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.go('/loginScreen');
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
