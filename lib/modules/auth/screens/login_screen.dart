import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/constants/app_dimensions.dart';
import 'package:student_guidance_platform/core/constants/app_strings.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';
import 'package:student_guidance_platform/core/utils/app_extensions.dart';
import 'package:student_guidance_platform/widgets/custom_buttons.dart';
import 'package:student_guidance_platform/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.loginSuccess)),
      );
      Navigator.of(context).pushReplacementNamed('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.paddingXLarge),
              Text(
                AppStrings.login,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppDimensions.paddingSmall),
              Text(
                'Welcome back! Continue to your account.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
              ),
              const SizedBox(height: AppDimensions.paddingXXLarge),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      label: AppStrings.email,
                      hint: 'Enter your email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppTheme.textSecondary,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Email is required';
                        }
                        if (!value!.isValidEmail()) {
                          return AppStrings.invalidEmail;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    CustomTextField(
                      label: AppStrings.password,
                      hint: 'Enter your password',
                      controller: _passwordController,
                      obscureText: true,
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: AppTheme.textSecondary,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Password is required';
                        }
                        if (value!.length < 6) {
                          return AppStrings.passwordTooShort;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppDimensions.paddingMedium),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.forgotPassword,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    GradientButton(
                      label: AppStrings.login,
                      onPressed: _handleLogin,
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.dontHaveAccount,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/signup');
                          },
                          child: Text(
                            AppStrings.signup,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
