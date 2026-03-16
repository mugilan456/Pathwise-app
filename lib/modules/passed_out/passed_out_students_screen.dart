import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/constants/app_dimensions.dart';
import 'package:student_guidance_platform/core/constants/app_strings.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';
import 'package:student_guidance_platform/core/utils/mock_data_provider.dart';
import 'package:student_guidance_platform/widgets/custom_app_bar.dart';
import 'package:student_guidance_platform/widgets/filter_chips.dart'
    as custom_filters;
import 'package:student_guidance_platform/widgets/passed_out_student_card.dart';

class PassedOutStudentsScreen extends StatefulWidget {
  const PassedOutStudentsScreen({super.key});

  @override
  State<PassedOutStudentsScreen> createState() =>
      _PassedOutStudentsScreenState();
}

class _PassedOutStudentsScreenState extends State<PassedOutStudentsScreen> {
  final List<String> _departments = [
    'All',
    'CS',
    'IT',
    'E&C',
    'Mechanical',
  ];
  String _selectedDepartment = 'All';
  final TextEditingController _searchController = TextEditingController();
  late List _filteredStudents;

  @override
  void initState() {
    super.initState();
    _filteredStudents = MockDataProvider.getPassedOutStudents();
  }

  void _filterStudents(String query) {
    setState(() {
      if (query.isEmpty && _selectedDepartment == 'All') {
        _filteredStudents = MockDataProvider.getPassedOutStudents();
      } else {
        _filteredStudents =
            MockDataProvider.getPassedOutStudents().where((student) {
          final matchesQuery =
              student.name.toLowerCase().contains(query.toLowerCase()) ||
                  student.currentCompany
                      .toLowerCase()
                      .contains(query.toLowerCase());
          final matchesDept = _selectedDepartment == 'All' ||
              student.department.startsWith(_selectedDepartment);
          return matchesQuery && matchesDept;
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
      appBar: const CustomAppBar(
        title: AppStrings.passedOutTitle,
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
                hint: 'Search alumni by name or company...',
                onChanged: _filterStudents,
              ),
              const SizedBox(height: AppDimensions.paddingXLarge),

              // Filter Chips
              Text(
                AppStrings.filter,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: AppDimensions.paddingMedium),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _departments.map((dept) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: AppDimensions.paddingSmall),
                      child: custom_filters.FilterChip(
                        label: dept,
                        isSelected: _selectedDepartment == dept,
                        onSelected: (selected) {
                          setState(() {
                            _selectedDepartment = selected ? dept : 'All';
                            _filterStudents(_searchController.text);
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
                AppStrings.successStories,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: AppDimensions.paddingMedium),

              // Student Cards List
              if (_filteredStudents.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.paddingXXLarge,
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.person_search,
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
                  itemCount: _filteredStudents.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppDimensions.paddingMedium),
                  itemBuilder: (context, index) {
                    final student = _filteredStudents[index];
                    return PassedOutStudentCard(
                      student: student,
                      onTap: () {
                        _showStudentDetails(context, student);
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

  void _showStudentDetails(context, student) {
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
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(student.profileImage),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.paddingLarge),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            student.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: AppDimensions.paddingSmall),
                          Text(
                            '${student.designation} at ${student.currentCompany}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppTheme.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    Text(
                      'Success Story',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: AppDimensions.paddingMedium),
                    Text(
                      student.story,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    Text(
                      'Skills',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: AppDimensions.paddingMedium),
                    Wrap(
                      spacing: AppDimensions.paddingSmall,
                      runSpacing: AppDimensions.paddingSmall,
                      children: student.skills.map((skill) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingMedium,
                            vertical: AppDimensions.paddingSmall,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMedium,
                            ),
                          ),
                          child: Text(
                            skill,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppTheme.primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        );
                      }).toList(),
                    ),
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
