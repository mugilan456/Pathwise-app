class Exam {
  final String id;
  final String name;
  final String organization;
  final String description;
  final DateTime examDate;
  final String registrationDeadline;
  final String eligibility;
  final String syllabus;
  final String examPattern;
  final List<String> successTips;
  final int registeredCandidates;
  final bool isRegistered;

  Exam({
    required this.id,
    required this.name,
    required this.organization,
    required this.description,
    required this.examDate,
    required this.registrationDeadline,
    required this.eligibility,
    required this.syllabus,
    required this.examPattern,
    required this.successTips,
    required this.registeredCandidates,
    this.isRegistered = false,
  });
}

class MockTest {
  final String id;
  final String title;
  final String examName;
  final String difficulty; // Easy, Medium, Hard
  final int totalQuestions;
  final int duration; // in minutes
  final DateTime createdDate;
  final int attempts;
  final double averageScore;

  MockTest({
    required this.id,
    required this.title,
    required this.examName,
    required this.difficulty,
    required this.totalQuestions,
    required this.duration,
    required this.createdDate,
    required this.attempts,
    required this.averageScore,
  });
}
