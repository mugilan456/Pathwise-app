import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/constants/app_dimensions.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';
import 'package:student_guidance_platform/models/passed_out_student_model.dart';
import 'package:student_guidance_platform/widgets/custom_cards.dart';

class PassedOutStudentCard extends StatelessWidget {
  final PassedOutStudent student;
  final VoidCallback? onTap;

  const PassedOutStudentCard({
    Key? key,
    required this.student,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(student.profileImage),
              ),
              const SizedBox(width: AppDimensions.paddingMedium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppDimensions.paddingXSmall),
                    Text(
                      '${student.designation} at ${student.currentCompany}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppTheme.primaryColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppDimensions.paddingXSmall),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: AppTheme.accentColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${student.rating}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: AppDimensions.paddingSmall),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.successColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusSmall,
                            ),
                          ),
                          child: Text(
                            'Class of ${student.graduationYear}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: AppTheme.successColor,
                                  fontWeight: FontWeight.w500,
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
          const SizedBox(height: AppDimensions.paddingMedium),
          Wrap(
            spacing: AppDimensions.paddingSmall,
            children: student.skills.take(3).map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingSmall,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusSmall,
                  ),
                ),
                child: Text(
                  skill,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
