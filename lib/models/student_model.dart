class StudentModel {
  String email;
  String name;
  String phoneNumber; // It's better to use String to store phone numbers
  Marks marks;

  StudentModel({
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.marks,
  });

  // Convert a Student object into a Map
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone_number': phoneNumber,
      'marks': marks.toMap(),
    };
  }

  // Create a Student object from a Map
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      email: map['email'],
      name: map['name'],
      phoneNumber: map['phone_number'],
      marks: Marks.fromMap(map['marks']),
    );
  }
}

class Marks {
  Term term1;
  Term term2;
  Term term3;

  Marks({
    required this.term1,
    required this.term2,
    required this.term3,
  });

  // Convert a Marks object into a Map
  Map<String, dynamic> toMap() {
    return {
      'term1': term1.toMap(),
      'term2': term2.toMap(),
      'term3': term3.toMap(),
    };
  }

  // Create a Marks object from a Map
  factory Marks.fromMap(Map<String, dynamic> map) {
    return Marks(
      term1: Term.fromMap(map['term1']),
      term2: Term.fromMap(map['term2']),
      term3: Term.fromMap(map['term3']),
    );
  }
}

class Term {
  int subject1;
  int subject2;
  int subject3;

  Term({
    required this.subject1,
    required this.subject2,
    required this.subject3,
  });

  // Convert a Term object into a Map
  Map<String, dynamic> toMap() {
    return {
      'subject1': subject1,
      'subject2': subject2,
      'subject3': subject3,
    };
  }

  // Create a Term object from a Map
  factory Term.fromMap(Map<String, dynamic> map) {
    return Term(
      subject1: map['subject1'],
      subject2: map['subject2'],
      subject3: map['subject3'],
    );
  }
}
