import 'package:assessment_tracker/controllers/auth_controller.dart';
import 'package:assessment_tracker/controllers/student_controller.dart';
import 'package:assessment_tracker/models/student_model.dart';
import 'package:assessment_tracker/resources/colors.dart';
import 'package:assessment_tracker/resources/components.dart';
import 'package:assessment_tracker/resources/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthController _authController = Get.put(AuthController());
  final StudentController _studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //to Do :
      appBar: AppBar(
        title: Obx(() {
          final student = _studentController.student.value;
          return Text(
            student?.name ?? 'Loading...',
            style: heading,
          );
        }),
        backgroundColor: green2,
        actions: [
          IconButton(
              onPressed: () {
                _authController.logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Obx(() {
            final student = _studentController.student.value;
            if (student == null) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Phone Number : ${student.phoneNumber}",
                    style: heading.copyWith(fontSize: 24.0),
                  ),
                  gap20,
                  termContainer('Term 1', student.marks.term1),
                  gap20,
                  termContainer('Term 2', student.marks.term2),
                  gap20,
                  termContainer('Term 3', student.marks.term3),
                ],
              );
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: green2,
          onPressed: () {
            Get.toNamed('/data');
          },
          child: Obx(() {
            final student = _studentController.student.value;
            if (student == null) {
              return const Icon(Icons.add);
            } else {
              return const Icon(Icons.edit);
            }
          })),
    );
  }

  double calculateAverage(Term term) {
    return (term.subject1 + term.subject2 + term.subject3) / 3.0;
  }

  Widget termContainer(String termTitle, Term term) {
    double average = calculateAverage(term);
    return Container(
      color: termTitle == 'Term 1'
          ? Colors.pink
          : termTitle == 'Term 2'
              ? Colors.grey
              : Colors.cyan,
      height: 200,
      width: 400,
      child: Column(children: [
        Text(termTitle, style: mediumText2),
        Text("Subject 1: ${term.subject1}"),
        Text("Subject 2: ${term.subject2}"),
        Text("Subject 3: ${term.subject3}"),
        Text("Average: ${average.toStringAsFixed(2)}", style: averageTxt),
      ]),
    );
  }
}
