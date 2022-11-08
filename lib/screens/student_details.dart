import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'student.dart';

class FirebaseOPS {
  Future<DocumentSnapshot<Map<String, dynamic>>> getStudentInfo() async {
    final referStudent = FirebaseFirestore.instance.collection('users');
    return await referStudent.doc("aadh").get();
  }

  Student setStudentInfo(DocumentSnapshot<Map<String, dynamic>> map) {
    String fname = map.get("fname");
    String lname = map.get("lname");
    String dept = map.get("Dept");
    return Student(fname: fname, lname: lname, dept: dept);
  }
}
