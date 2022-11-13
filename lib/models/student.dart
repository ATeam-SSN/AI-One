import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Student extends ChangeNotifier {
  String fname, dept;
  late Map<String, dynamic> reminders;
  late Map<String, dynamic> attendance;
  late Map<String, dynamic> timetable;

  Student({required this.fname, required this.dept});

  void printStudent() {
    print(fname);

    print(dept);
  }

  void changeFname(String newName) async {
    fname = newName;
    FirebaseFirestore.instance
        .collection('users')
        .doc("aadh")
        .update({"fname": newName});

    notifyListeners();
  }
}
