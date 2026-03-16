import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/constants/app_dimensions.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';
import 'package:student_guidance_platform/models/current_student_model.dart';
import 'package:student_guidance_platform/widgets/custom_cards.dart';

class OpportunityCard extends StatefulWidget {
  final Opportunity opportunity;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onFavoriteChanged;

  const OpportunityCard({
    super.key,
    required this.opportunity,
    this.onTap,
    this.onFavoriteChanged,
  });

  @override
  State<OpportunityCard> createState() => _OpportunityCardState();
}

class _OpportunityCardState extends State<OpportunityCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.opportunity.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getTypeColor().withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusSmall,
                        ),
                      ),
                      child: Text(
                        widget.opportunity.type,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: _getTypeColor(),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.paddingSmall),
                    Text(
                      widget.opportunity.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                  widget.onFavoriteChanged?.call(_isFavorite);
                },
                child: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? AppTheme.errorColor : AppTheme.textTertiary,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          Text(
            widget.opportunity.company,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
          ),
          const SizedBox(height: AppDimensions.paddingSmall),
          Text(
            widget.opportunity.description,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stipend',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppTheme.textTertiary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.opportunity.stipend,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Applicants',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppTheme.textTertiary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.opportunity.applicants}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Apply by: ${widget.opportunity.deadline.day}/${widget.opportunity.deadline.month}/${widget.opportunity.deadline.year}',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppTheme.warningColor),
            ),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor() {
    switch (widget.opportunity.type.toLowerCase()) {
      case 'internship':
        return AppTheme.primaryColor;
      case 'workshop':
        return AppTheme.secondaryColor;
      case 'full-time':
        return AppTheme.accentColor;
      default:
        return AppTheme.primaryColor;
    }
  }
}
