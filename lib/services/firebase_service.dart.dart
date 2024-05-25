



























// import 'package:assessment_tracker/models/student_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebaseService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> addUser(StudentModel user) async {
//     await _firestore.collection('users').doc(user.email).set(user.toMap());
//   }

//   Future<StudentModel?> getUser(String uid) async {
//     DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
//     if (doc.exists) {
//       return StudentModel.fromMap(doc.data() as Map<String, dynamic>);
//     }
//     return null;
//   }

//   Future<void> updateUser(StudentModel user) async {
//     await _firestore.collection('users').doc(user.email).update(user.toMap());
//   }
// }
