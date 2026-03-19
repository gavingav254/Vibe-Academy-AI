class CourseModel {
  final String id;
  final String title;
  final String description;
  final int lessonCount;
  final int enrolledStudents;
  final String difficulty;
  final double rating;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.lessonCount,
    required this.enrolledStudents,
    this.difficulty = 'Beginner',
    this.rating = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'lessonCount': lessonCount,
      'enrolledStudents': enrolledStudents,
      'difficulty': difficulty,
      'rating': rating,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      lessonCount: map['lessonCount'] ?? 0,
      enrolledStudents: map['enrolledStudents'] ?? 0,
      difficulty: map['difficulty'] ?? 'Beginner',
      rating: (map['rating'] ?? 0).toDouble(),
    );
  }
}
