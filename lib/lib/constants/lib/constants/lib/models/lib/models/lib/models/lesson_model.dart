class LessonModel {
  final String id;
  final String title;
  final String description;
  final int duration;
  final bool isCompleted;

  LessonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'isCompleted': isCompleted,
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    return LessonModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      duration: map['duration'] ?? 0,
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  LessonModel copyWith({bool? isCompleted}) {
    return LessonModel(
      id: id,
      title: title,
      description: description,
      duration: duration,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
