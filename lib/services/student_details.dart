import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:ssn_qos/models/student.dart';

class FirebaseOPS {
  Future<DocumentSnapshot<Map<String, dynamic>>> getStudentInfo() async {
    final referStudent = FirebaseFirestore.instance.collection('users');
    return await referStudent.doc("aadh").get();
  }

  Student setStudentInfo(DocumentSnapshot<Map<String, dynamic>> map) {
    String fname = map.get("fname");
    String dept = map.get("Dept");
    String section = map.get("Section");
    Student Details = Student(fname: fname, dept: dept, section: section);
    Details.reminders = map.get("reminder");
    Details.attendance = map.get('attd');
    Details.timetable = map.get('timtable');

    return Details;
  }
}
