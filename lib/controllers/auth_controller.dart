import 'package:assessment_tracker/pages/home_page.dart';
import 'package:assessment_tracker/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  ///Observable User
  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
    ever(user, handleAuthChanged);
  }

  void handleAuthChanged(User? firebaseUser) {
    if (firebaseUser == null) {
      if (Get.currentRoute != '/LoginPage') {
        Get.offAll(() => const LoginPage());
      }
    } else {
      if (Get.currentRoute != '/HomePage') {
        Get.offAll(() => HomePage());
      }
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.toNamed('/home');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.toNamed('/home');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
