import 'package:flutter/material.dart';
import 'package:student_guidance_platform/core/constants/app_dimensions.dart';
import 'package:student_guidance_platform/core/constants/app_strings.dart';
import 'package:student_guidance_platform/core/theme/app_theme.dart';
import 'package:student_guidance_platform/core/utils/mock_data_provider.dart';
import 'package:student_guidance_platform/widgets/custom_app_bar.dart';
import 'package:student_guidance_platform/widgets/custom_buttons.dart';
import 'package:student_guidance_platform/widgets/exam_card.dart';

class CompetitiveExamsScreen extends StatefulWidget {
  const CompetitiveExamsScreen({Key? key}) : super(key: key);

  @override
  State<CompetitiveExamsScreen> createState() => _CompetitiveExamsScreenState();
}

class _CompetitiveExamsScreenState extends State<CompetitiveExamsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.competitiveExamsTitle,
        showBackButton: true,
        backgroundColor: AppTheme.surfaceColor,
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            color: AppTheme.surfaceColor,
            child: TabBar(
              controller: _tabController,
              labelColor: AppTheme.primaryColor,
              unselectedLabelColor: AppTheme.textSecondary,
              indicatorColor: AppTheme.primaryColor,
              labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              tabs: const [
                Tab(text: AppStrings.upcomingExams),
                Tab(text: AppStrings.mockTests),
              ],
            ),
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Upcoming Exams Tab
                _buildUpcomingExamsTab(context),
                // Mock Tests Tab
                _buildMockTestsTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingExamsTab(BuildContext context) {
    final exams = MockDataProvider.getCompetitiveExams();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Prepare for your dream exam',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: exams.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppDimensions.paddingMedium),
            itemBuilder: (context, index) {
              final exam = exams[index];
              return ExamCard(
                exam: exam,
                onTap: () {
                  _showExamDetails(context, exam);
                },
              );
            },
          ),
          const SizedBox(height: AppDimensions.paddingXXLarge),
        ],
      ),
    );
  }

  Widget _buildMockTestsTab(BuildContext context) {
    final mockTests = MockDataProvider.getMockTests();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Test your preparation with mock exams',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mockTests.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppDimensions.paddingMedium),
            itemBuilder: (context, index) {
              final mockTest = mockTests[index];
              return MockTestCard(
                mockTest: mockTest,
                onTap: () {
                  _showMockTestDetails(context, mockTest);
                },
              );
            },
          ),
          const SizedBox(height: AppDimensions.paddingXXLarge),
        ],
      ),
    );
  }

  void _showExamDetails(context, exam) {
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
                      exam.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: AppDimensions.paddingSmall),
                    Text(
                      exam.organization,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppTheme.primaryColor),
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    _buildDetailSection(
                      context,
                      'Description',
                      exam.description,
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    _buildDetailSection(
                      context,
                      'Eligibility',
                      exam.eligibility,
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    _buildDetailSection(
                      context,
                      'Exam Pattern',
                      exam.examPattern,
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    Text(
                      'Success Tips',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: AppDimensions.paddingMedium),
                    ...exam.successTips.map((tip) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimensions.paddingSmall,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppTheme.successColor,
                              size: 20,
                            ),
                            const SizedBox(width: AppDimensions.paddingMedium),
                            Expanded(
                              child: Text(
                                tip,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: AppDimensions.paddingXXLarge),
                    GradientButton(
                      label: 'Register Now',
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Registered for ${exam.name} successfully!'),
                          ),
                        );
                      },
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

  void _showMockTestDetails(context, mockTest) {
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
                      mockTest.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: AppDimensions.paddingSmall),
                    Text(
                      mockTest.examName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppTheme.primaryColor),
                    ),
                    const SizedBox(height: AppDimensions.paddingXLarge),
                    Row(
                      children: [
                        _buildStatCard(
                          context,
                          Icons.book,
                          '${mockTest.totalQuestions}',
                          'Questions',
                        ),
                        const SizedBox(width: AppDimensions.paddingMedium),
                        _buildStatCard(
                          context,
                          Icons.timer,
                          '${mockTest.duration} min',
                          'Duration',
                        ),
                        const SizedBox(width: AppDimensions.paddingMedium),
                        _buildStatCard(
                          context,
                          Icons.trending_up,
                          '${mockTest.averageScore}%',
                          'Avg Score',
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.paddingXXLarge),
                    Container(
                      padding:
                          const EdgeInsets.all(AppDimensions.paddingMedium),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusMedium,
                        ),
                      ),
                      child: Text(
                        '${mockTest.attempts} students have attempted this test',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.paddingXXLarge),
                    GradientButton(
                      label: 'Start Test',
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Starting the test...'),
                          ),
                        );
                      },
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

  Widget _buildDetailSection(
    BuildContext context,
    String title,
    String content,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.paddingMedium),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppTheme.primaryColor, size: 24),
            const SizedBox(height: AppDimensions.paddingSmall),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppTheme.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
