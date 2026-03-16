import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/constants/app_dimensions.dart';
import 'package:student_guidance_platform/core/constants/app_strings.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';
import 'package:student_guidance_platform/core/utils/app_extensions.dart';
import 'package:student_guidance_platform/widgets/custom_buttons.dart';
import 'package:student_guidance_platform/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.signupSuccess)),
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
              const SizedBox(height: AppDimensions.paddingLarge),
              Text(
                AppStrings.signup,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppDimensions.paddingSmall),
              Text(
                'Create your account to get started.',
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
                      label: AppStrings.fullName,
                      hint: 'Enter your full name',
                      controller: _nameController,
                      prefixIcon: const Icon(
                        Icons.person_outlined,
                        color: AppTheme.textSecondary,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Full name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
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
                      hint: 'Create a password',
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
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    CustomTextField(
                      label: AppStrings.confirmPassword,
                      hint: 'Confirm your password',
                      controller: _confirmPasswordController,
                      obscureText: true,
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: AppTheme.textSecondary,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return AppStrings.passwordsNotMatch;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppDimensions.paddingXXLarge),
                    GradientButton(
                      label: AppStrings.signup,
                      onPressed: _handleSignup,
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.alreadyHaveAccount,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/login');
                          },
                          child: Text(
                            AppStrings.login,
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
