import 'package:assessment_tracker/controllers/student_controller.dart';
import 'package:assessment_tracker/models/student_model.dart';
import 'package:assessment_tracker/resources/colors.dart';
import 'package:assessment_tracker/resources/components.dart';
import 'package:assessment_tracker/resources/style.dart';
import 'package:assessment_tracker/resources/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final StudentController _studentController = Get.put(StudentController());

  late TextEditingController _nameController;
  late TextEditingController _phoneNoController;
  late TextEditingController _term1sub1Controller;
  late TextEditingController _term1sub2Controller;
  late TextEditingController _term1sub3Controller;
  late TextEditingController _term2sub1Controller;
  late TextEditingController _term2sub2Controller;
  late TextEditingController _term2sub3Controller;
  late TextEditingController _term3sub1Controller;
  late TextEditingController _term3sub2Controller;
  late TextEditingController _term3sub3Controller;

  @override
  void initState() {
    super.initState();
    final student = _studentController.student.value;
    _nameController = TextEditingController(text: student?.name ?? '');
    _phoneNoController =
        TextEditingController(text: student?.phoneNumber ?? '');
    _term1sub1Controller = TextEditingController(
        text: student?.marks.term1.subject1.toString() ?? '');
    _term1sub2Controller = TextEditingController(
        text: student?.marks.term1.subject2.toString() ?? '');
    _term1sub3Controller = TextEditingController(
        text: student?.marks.term1.subject3.toString() ?? '');
    _term2sub1Controller = TextEditingController(
        text: student?.marks.term2.subject1.toString() ?? '');
    _term2sub2Controller = TextEditingController(
        text: student?.marks.term2.subject2.toString() ?? '');
    _term2sub3Controller = TextEditingController(
        text: student?.marks.term2.subject3.toString() ?? '');
    _term3sub1Controller = TextEditingController(
        text: student?.marks.term3.subject1.toString() ?? '');
    _term3sub2Controller = TextEditingController(
        text: student?.marks.term3.subject2.toString() ?? '');
    _term3sub3Controller = TextEditingController(
        text: student?.marks.term3.subject3.toString() ?? '');
  }

  void _updateData() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text.trim();
      String phoneNumber = _phoneNoController.text.trim();

      Term term1 = Term(
        subject1: int.parse(_term1sub1Controller.text.trim()),
        subject2: int.parse(_term1sub2Controller.text.trim()),
        subject3: int.parse(_term1sub3Controller.text.trim()),
      );

      Term term2 = Term(
        subject1: int.parse(_term2sub1Controller.text.trim()),
        subject2: int.parse(_term2sub2Controller.text.trim()),
        subject3: int.parse(_term2sub3Controller.text.trim()),
      );

      Term term3 = Term(
        subject1: int.parse(_term3sub1Controller.text.trim()),
        subject2: int.parse(_term3sub2Controller.text.trim()),
        subject3: int.parse(_term3sub3Controller.text.trim()),
      );

      Marks marks = Marks(term1: term1, term2: term2, term3: term3);

      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        StudentModel studentModel = StudentModel(
          email: currentUser.email!,
          name: name,
          phoneNumber: phoneNumber,
          marks: marks,
        );

        _studentController.addOrUpdateStudent(studentModel);

        Get.snackbar('Done', 'Your Data Updated Correctly',
            backgroundColor: green2);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Page", style: heading),
        backgroundColor: green2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                gap20,
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  controller: _phoneNoController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Term 1', style: mediumText),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject 1'),
                  controller: _term1sub1Controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter marks for Subject 1';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject 2'),
                  controller: _term1sub2Controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter marks for Subject 2';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject 3'),
                  controller: _term1sub3Controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter marks for Subject 3';
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Term 2', style: mediumText),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject 1'),
                  controller: _term2sub1Controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter marks for Subject 1';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject 2'),
                  controller: _term2sub2Controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter marks for Subject 2';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject 3'),
                  controller: _term2sub3Controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter marks for Subject 3';
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Term 3', style: mediumText),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject 1'),
                  controller: _term3sub1Controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter marks for Subject 1';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject 2'),
                  controller: _term3sub2Controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter marks for Subject 2';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject 3'),
                  controller: _term3sub3Controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter marks for Subject 3';
                    }
                    return null;
                  },
                ),
                gap20,
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: _updateData,
                  child: const Text("Update", style: buttonText),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
