import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';
import '../home/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.pushReplacement(const MainPage());
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SizedBox(
                height: 260.0,
                child: Center(
                  child: Assets.images.logoWhite.image(height: 55.0),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20.0)),
                    child: ColoredBox(
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 44.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller: emailController,
                              label: 'Email',
                              isOutlineBorder: false,
                            ),
                            const SpaceHeight(36.0),
                            CustomTextField(
                              controller: passwordController,
                              label: 'Password',
                              isOutlineBorder: false,
                              obscureText: true,
                            ),
                            const SpaceHeight(86.0),
                            state is AuthLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Button.filled(
                                    onPressed: () {
                                      context.read<AuthBloc>().add(LoginEvent(
                                          emailController.text.trim(),
                                          passwordController.text.trim()));

                                      // context.pushReplacement(const MainPage());
                                      // print(emailController);
                                      // print(passwordController);
                                    },
                                    label: 'Login',
                                  ),
                            const SpaceHeight(128.0),
                            Center(
                              child: Assets.images.logoCwb.image(height: 40.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
