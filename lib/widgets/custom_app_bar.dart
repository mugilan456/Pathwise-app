import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/constants/app_dimensions.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Color backgroundColor;
  final bool showProfileIcon;
  final bool showNotificationIcon;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onNotificationPressed;
  final int? notificationCount;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions,
    this.backgroundColor = AppTheme.surfaceColor,
    this.showProfileIcon = false,
    this.showNotificationIcon = false,
    this.onProfilePressed,
    this.onNotificationPressed,
    this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null,
      actions: [
        if (showNotificationIcon)
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: onNotificationPressed,
              ),
              if (notificationCount != null && notificationCount! > 0)
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppTheme.errorColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        if (showProfileIcon)
          Padding(
            padding: const EdgeInsets.only(right: AppDimensions.paddingMedium),
            child: GestureDetector(
              onTap: onProfilePressed,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.borderColor,
                    width: 2,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    'https://api.dicebear.com/7.x/avataaars/svg?seed=John',
                  ),
                ),
              ),
            ),
          ),
        if (actions != null) ...actions!,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
