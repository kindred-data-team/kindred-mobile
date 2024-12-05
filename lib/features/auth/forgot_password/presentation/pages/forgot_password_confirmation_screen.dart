import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kindred_app/common/constants/routes.dart';
import 'package:kindred_app/core/presentation/widgets/custom_textfield.dart';
import 'package:kindred_app/core/presentation/widgets/default_button.dart';
import 'package:kindred_app/features/auth/bloc/auth_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPasswordConfirmationScreen extends StatefulWidget {
  const ForgotPasswordConfirmationScreen({super.key});

  @override
  State<ForgotPasswordConfirmationScreen> createState() => _ForgotPasswordConfirmationScreenState();
}

class _ForgotPasswordConfirmationScreenState extends State<ForgotPasswordConfirmationScreen> {
  final TextEditingController emailController = TextEditingController();
  late AuthBloc _authBloc;
  bool isLoading = false;

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              context.push('/loginScreen');
              //use enum
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
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
              "Forgot Password",
              style: TextStyle(fontSize: 28.px),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "We need to send a confirmation link to your registered email to verify that it’s you",
              style: TextStyle(fontSize: 14.px),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            labelText: "Email",
            hintText: "Email",
            controller: emailController,
            obscureText: false,
          ),
          const SizedBox(
            height: 40,
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthInitial) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is AuthForgotPasswordSuccess) {
                setState(() {
                  isLoading = false;
                });

                context.go(Routes.forgotPasswordResetPasswordScreen.path);
              }
              if (state is AuthFailure) {
                setState(() {
                  isLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed: ${state.error}')),
                );
              }
            },
            builder: (context, state) {
              return GlobalButton(
                  label: "Submit",
                  isLoading: isLoading,
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    _authBloc.add(ForgotPasswordRequestEvent(email: emailController.text));
                  });
            },
          ),
        ],
      ),
    );
  }
}
