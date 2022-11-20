import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Map<String, dynamic> GetTimeTable(String dept, String Section) {
  Map<String, dynamic> timetable = {};
  print(dept);
  print(Section);
  if (dept == "BTech IT" && Section == "A") {
    Map<String, dynamic> timetable = {
      "Sunday": {
        "sub1": {"name": "Elective", "start": "8:00", "end": "8:50"},
        "sub2": {
          "name": "UIT1502 - Principles of Operating Systems",
          "start": "8:50",
          "end": "9:40"
        },
        "sub3": {
          "name": "UIT1504 - Digital Signal Processing",
          "start": "10:05",
          "end": "10:55"
        },
        "sub4": {"name": "Elective", "start": "10:55", "end": "11:45"},
        "sub5": {"name": "Elective", "start": "12:45", "end": "13:35"},
        "sub6": {"name": "Elective", "start": "13:35", "end": "14:25"},
        "sub7": {"name": "Elective", "start": "14:50", "end": "15:40"},
      },
      "Monday": {
        "sub1": {"name": "Elective", "start": "8:00", "end": "8:50"},
        "sub2": {
          "name": "UIT1502 - Principles of Operating Systems",
          "start": "8:50",
          "end": "9:40"
        },
        "sub3": {
          "name": "UIT1504 - Digital Signal Processing",
          "start": "10:05",
          "end": "10:55"
        },
        "sub4": {"name": "Elective", "start": "10:55", "end": "11:45"},
        "sub5": {"name": "Elective", "start": "12:45", "end": "13:35"},
        "sub6": {"name": "Elective", "start": "13:35", "end": "14:25"},
        "sub7": {"name": "Elective", "start": "14:50", "end": "15:40"},
      },
      "Tuesday": {
        "sub1": {"name": "Elective", "start": "8:00", "end": "8:50"},
        "sub2": {"name": "Elective", "start": "8:50", "end": "9:40"},
        "sub3": {"name": "Elective", "start": "10:05", "end": "10:55"},
        "sub4": {"name": "Elective", "start": "10:55", "end": "11:45"},
        "sub5": {"name": "Elective", "start": "12:45", "end": "13:35"},
        "sub6": {"name": "Elective", "start": "13:35", "end": "14:25"},
        "sub7": {"name": "Elective", "start": "14:50", "end": "15:40"},
      },
      "Wednesday": {
        "sub1": {"name": "Elective", "start": "8:00", "end": "8:50"},
        "sub2": {"name": "Elective", "start": "8:50", "end": "9:40"},
        "sub3": {"name": "Elective", "start": "10:05", "end": "10:55"},
        "sub4": {"name": "Elective", "start": "10:55", "end": "11:45"},
        "sub5": {"name": "Elective", "start": "12:45", "end": "13:35"},
        "sub6": {"name": "Elective", "start": "13:35", "end": "14:25"},
        "sub7": {"name": "Elective", "start": "14:50", "end": "15:40"},
      },
      "Thursday": {
        "sub1": {"name": "Elective", "start": "8:00", "end": "8:50"},
        "sub2": {"name": "Elective", "start": "8:50", "end": "9:40"},
        "sub3": {"name": "Elective", "start": "10:05", "end": "10:55"},
        "sub4": {"name": "Elective", "start": "10:55", "end": "11:45"},
        "sub5": {"name": "Elective", "start": "12:45", "end": "13:35"},
        "sub6": {"name": "Elective", "start": "13:35", "end": "14:25"},
        "sub7": {"name": "Elective", "start": "14:50", "end": "15:40"},
      },
      "Friday": {
        "sub1": {"name": "Elective", "start": "8:00", "end": "8:50"},
        "sub2": {"name": "Elective", "start": "8:50", "end": "9:40"},
        "sub3": {"name": "Elective", "start": "10:05", "end": "10:55"},
        "sub4": {"name": "Elective", "start": "10:55", "end": "11:45"},
        "sub5": {"name": "Elective", "start": "12:45", "end": "13:35"},
        "sub6": {"name": "Elective", "start": "13:35", "end": "14:25"},
        "sub7": {"name": "Elective", "start": "14:50", "end": "15:40"},
      },
    };
    return timetable;
  }
  return timetable;
}

class Student extends ChangeNotifier {
  String fname, dept, section;
  late Map<String, dynamic> reminders;
  late Map<String, dynamic> attendance;
  late Map<String, dynamic> timetable;

  Student({required this.fname, required this.dept, required this.section});

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
