import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';
import 'package:student_guidance_platform/modules/auth/screens/login_screen.dart';
import 'package:student_guidance_platform/modules/auth/screens/onboarding_screen.dart';
import 'package:student_guidance_platform/modules/auth/screens/signup_screen.dart';
import 'package:student_guidance_platform/modules/auth/screens/splash_screen.dart';
import 'package:student_guidance_platform/modules/competitive_exams/competitive_exams_screen.dart';
import 'package:student_guidance_platform/modules/current_student/current_student_screen.dart';
import 'package:student_guidance_platform/modules/dashboard/dashboard_screen.dart';
import 'package:student_guidance_platform/modules/passed_out/passed_out_students_screen.dart';

class StudentGuidanceApp extends StatelessWidget {
  const StudentGuidanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Guidance Platform',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/passed_out': (context) => const PassedOutStudentsScreen(),
        '/current_student': (context) => const CurrentStudentScreen(),
        '/competitive_exams': (context) => const CompetitiveExamsScreen(),
      },
    );
  }
}
