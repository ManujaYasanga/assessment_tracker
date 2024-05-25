import 'package:assessment_tracker/models/student_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var user = Rxn<User>();
  var student = Rxn<StudentModel>();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
    ever(user, getData);
  }

  void getData(User? firebaseUser) async {
    if (firebaseUser != null) {
      DocumentSnapshot doc =
          await firestore.collection('students').doc(firebaseUser.email).get();
      if (doc.exists) {
        student.value =
            StudentModel.fromMap(doc.data() as Map<String, dynamic>);
      }
    } else {
      student.value = null;
    }
  }

  Future<void> addOrUpdateStudent(StudentModel studentModel) async {
    await firestore
        .collection('students')
        .doc(auth.currentUser!.email)
        .set(studentModel.toMap());
    student.value = studentModel;
    update();
  }

  Future<void> updateMarks(String email, Marks newMarks) async {
    await firestore
        .collection('students')
        .doc(email)
        .update({'marks': newMarks.toMap()});
    student.value!.marks = newMarks;
    update();
  }
}
