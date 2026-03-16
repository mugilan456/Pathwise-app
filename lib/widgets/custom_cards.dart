import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/constants/app_dimensions.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';

class GradientCard extends StatelessWidget {
  final List<Color> gradientColors;
  final Widget child;
  final double? height;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final BorderRadius? borderRadius;

  const GradientCard({
    super.key,
    required this.gradientColors,
    required this.child,
    this.height,
    this.onTap,
    this.padding = const EdgeInsets.all(AppDimensions.paddingLarge),
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppDimensions.radiusLarge),
          boxShadow: [
            BoxShadow(
              color: gradientColors.first.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class PremiumCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final Color backgroundColor;
  final List<BoxShadow>? shadows;

  const PremiumCard({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.onTap,
    this.padding = const EdgeInsets.all(AppDimensions.paddingMedium),
    this.backgroundColor = AppTheme.surfaceColor,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          boxShadow: shadows ??
              [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
