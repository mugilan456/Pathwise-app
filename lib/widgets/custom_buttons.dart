import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/constants/app_dimensions.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final List<Color>? gradientColors;
  final double? width;
  final double height;
  final Icon? leadingIcon;
  final Icon? trailingIcon;

  const GradientButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.gradientColors,
    this.width,
    this.height = AppDimensions.buttonHeight,
    this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors ??
              [AppTheme.primaryColor, AppTheme.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leadingIcon != null) ...[
                leadingIcon!,
                const SizedBox(width: AppDimensions.paddingSmall),
              ],
              Text(
                label,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: AppDimensions.paddingSmall),
                trailingIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class OutlineGradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color borderColor;
  final double? width;
  final double height;

  const OutlineGradientButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.borderColor = AppTheme.primaryColor,
    this.width,
    this.height = AppDimensions.buttonHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: borderColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
