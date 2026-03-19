import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/course_model.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CourseModel>> getCourses() async {
    try {
      final snapshot = await _db.collection('courses').get();
      return snapshot.docs.map((doc) => CourseModel.fromMap(doc.data())).toList();
    } catch (e) {
      print('GetCourses Error: $e');
      return [];
    }
  }

  Future<CourseModel?> getCourseById(String id) async {
    try {
      final doc = await _db.collection('courses').doc(id).get();
      if (doc.exists) {
        return CourseModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('GetCourseById Error: $e');
      return null;
    }
  }

  Future<void> addCourse(CourseModel course) async {
    try {
      await _db.collection('courses').doc(course.id).set(course.toMap());
    } catch (e) {
      print('AddCourse Error: $e');
      rethrow;
    }
  }

  Future<void> markLessonAsCompleted(String userId, String courseId, String lessonId) async {
    try {
      await _db.collection('users').doc(userId).update({
        'completedLessons': FieldValue.arrayUnion([lessonId])
      });
    } catch (e) {
      print('MarkLessonAsCompleted Error: $e');
      rethrow;
    }
  }
}
