class UserModel {
  final String uid;
  final String email;
  final String fullName;
  final DateTime createdAt;
  final List<String> enrolledCourses;

  UserModel({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.createdAt,
    this.enrolledCourses = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'createdAt': createdAt,
      'enrolledCourses': enrolledCourses,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      createdAt: map['createdAt'] ?? DateTime.now(),
      enrolledCourses: List<String>.from(map['enrolledCourses'] ?? []),
    );
  }
}
