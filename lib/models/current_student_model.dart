class CurrentStudent {
  final String id;
  final String name;
  final String semester;
  final String department;
  final double cgpa;
  final String profileImage;
  final String bio;

  CurrentStudent({
    required this.id,
    required this.name,
    required this.semester,
    required this.department,
    required this.cgpa,
    required this.profileImage,
    required this.bio,
  });
}

class Opportunity {
  final String id;
  final String title;
  final String company;
  final String type; // Internship, Full-time, Workshop
  final String description;
  final String duration;
  final String location;
  final String stipend;
  final DateTime deadline;
  final List<String> requirements;
  final int applicants;
  final bool isFavorite;

  Opportunity({
    required this.id,
    required this.title,
    required this.company,
    required this.type,
    required this.description,
    required this.duration,
    required this.location,
    required this.stipend,
    required this.deadline,
    required this.requirements,
    required this.applicants,
    this.isFavorite = false,
  });
}
