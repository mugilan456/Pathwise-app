import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/constants/app_dimensions.dart';
import 'package:student_guidance_platform/core/constants/app_strings.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';
import 'package:student_guidance_platform/core/utils/mock_data_provider.dart';
import 'package:student_guidance_platform/widgets/custom_app_bar.dart';
import 'package:student_guidance_platform/widgets/filter_chips.dart'
    as custom_filters;
import 'package:student_guidance_platform/widgets/opportunity_card.dart';

class CurrentStudentScreen extends StatefulWidget {
  const CurrentStudentScreen({Key? key}) : super(key: key);

  @override
  State<CurrentStudentScreen> createState() => _CurrentStudentScreenState();
}

class _CurrentStudentScreenState extends State<CurrentStudentScreen> {
  final List<String> _opportunityTypes = [
    'All',
    'Internship',
    'Workshop',
    'Full-time'
  ];
  String _selectedType = 'All';
  final TextEditingController _searchController = TextEditingController();
  late List _filteredOpportunities;

  @override
  void initState() {
    super.initState();
    _filteredOpportunities = MockDataProvider.getOpportunities();
  }

  void _filterOpportunities(String query) {
    setState(() {
      if (query.isEmpty && _selectedType == 'All') {
        _filteredOpportunities = MockDataProvider.getOpportunities();
      } else {
        _filteredOpportunities =
            MockDataProvider.getOpportunities().where((opportunity) {
          final matchesQuery = opportunity.title.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ||
              opportunity.company.toLowerCase().contains(
                    query.toLowerCase(),
                  );
          final matchesType = _selectedType == 'All' ||
              opportunity.type.toLowerCase() == _selectedType.toLowerCase();
          return matchesQuery && matchesType;
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.currentStudentTitle,
        showBackButton: true,
        backgroundColor: AppTheme.surfaceColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              custom_filters.SearchBar(
                controller: _searchController,
                hint: 'Search opportunities...',
                onChanged: _filterOpportunities,
              ),
              const SizedBox(height: AppDimensions.paddingXLarge),

              // Filter Chips
              Text(
                'Type',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: AppDimensions.paddingMedium),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _opportunityTypes.map((type) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: AppDimensions.paddingSmall),
                      child: custom_filters.FilterChip(
                        label: type,
                        isSelected: _selectedType == type,
                        onSelected: (selected) {
                          setState(() {
                            _selectedType = selected ? type : 'All';
                            _filterOpportunities(_searchController.text);
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: AppDimensions.paddingXXLarge),

              // Title
              Text(
                AppStrings.internships,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: AppDimensions.paddingMedium),

              // Opportunity Cards List
              if (_filteredOpportunities.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.paddingXXLarge,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.work_outline,
                          size: 48,
                          color: AppTheme.textTertiary,
                        ),
                        const SizedBox(height: AppDimensions.paddingMedium),
                        Text(
                          AppStrings.noData,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppTheme.textSecondary),
                        ),
                      ],
                    ),
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _filteredOpportunities.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppDimensions.paddingMedium),
                  itemBuilder: (context, index) {
                    final opportunity = _filteredOpportunities[index];
                    return OpportunityCard(
                      opportunity: opportunity,
                      onTap: () {
                        _showOpportunityDetails(context, opportunity);
                      },
                      onFavoriteChanged: (isFavorite) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isFavorite
                                  ? 'Added to favorites'
                                  : 'Removed from favorites',
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              const SizedBox(height: AppDimensions.paddingXXLarge),
            ],
          ),
        ),
      ),
    );
  }

  void _showOpportunityDetails(context, opportunity) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.radiusXLarge),
                  topRight: Radius.circular(AppDimensions.radiusXLarge),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppTheme.borderColor,
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusSmall),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    Text(
                      opportunity.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: AppDimensions.paddingSmall),
                    Text(
                      opportunity.company,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppTheme.primaryColor),
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    Text(
                      'About',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: AppDimensions.paddingMedium),
                    Text(
                      opportunity.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    Text(
                      'Requirements',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: AppDimensions.paddingMedium),
                    ...opportunity.requirements.map((req) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimensions.paddingSmall,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.only(
                                top: AppDimensions.paddingSmall,
                                right: AppDimensions.paddingMedium,
                              ),
                              decoration: const BoxDecoration(
                                color: AppTheme.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                req,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: AppDimensions.paddingXXLarge),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
