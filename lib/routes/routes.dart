import 'package:assessment_tracker/authenticate.dart';
import 'package:assessment_tracker/pages/data_page.dart';
import 'package:assessment_tracker/pages/home_page.dart';
import 'package:assessment_tracker/pages/login_page.dart';
import 'package:assessment_tracker/pages/register_page.dart';
import 'package:get/get.dart';

final List<GetPage> appRoutes = [
  GetPage(name: '/', page: () => Authenticate()),
  GetPage(name: '/register', page: () => const RegisterPage()),
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/home', page: () => HomePage()),
  GetPage(name: '/data', page: () => const DataPage()),
];
