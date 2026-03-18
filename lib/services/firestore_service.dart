import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCourses() async {
    final snapshot = await _db.collection('courses').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<Map<String, dynamic>?> getCourseById(String id) async {
    final doc = await _db.collection('courses').doc(id).get();
    return doc.data();
  }

  Future<void> addCourse(Map<String, dynamic> courseData) async {
    await _db.collection('courses').add(courseData);
  }

  Future<void> markLessonAsCompleted(String courseId, String lessonId) async {
    await _db.collection('courses').doc(courseId).update({
      'completedLessons': FieldValue.arrayUnion([lessonId])
    });
  }

  Future<List<String>> getCompletedLessons(String courseId) async {
    final doc = await _db.collection('courses').doc(courseId).get();
    return List<String>.from(doc.data()?['completedLessons'] ?? []);
  }

  Future<void> saveChatMessage(String courseId, Map<String, dynamic> messageData) async {
    await _db.collection('courses').doc(courseId).collection('chat').add(messageData);
  }

  Future<List<Map<String, dynamic>>> getChatHistory(String courseId) async {
    final snapshot = await _db.collection('courses').doc(courseId).collection('chat').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}