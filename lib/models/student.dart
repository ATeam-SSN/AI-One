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
        "sub1": {
          "name": "Elective",
          "start": "8:00",
          "end": "8:50",
          "Faculty": "Prof. Chithra",
        },
        "sub2": {
          "name": "UIT1502 - Principles of Operating Systems",
          "start": "8:50",
          "end": "9:40",
          "Faculty": "Prof. Chithra",
        },
        "sub3": {
          "name": "UIT1504 - Digital Signal Processing",
          "start": "10:05",
          "end": "10:55",
          "Faculty": "Prof. Chithra",
        },
        "sub4": {
          "name": "Elective",
          "start": "10:55",
          "end": "11:45",
          "Faculty": "Prof. Chithra",
        },
        "sub5": {
          "name": "Elective",
          "start": "12:45",
          "end": "13:35",
          "Faculty": "Prof. Chithra",
        },
        "sub6": {
          "name": "Elective",
          "start": "13:35",
          "end": "14:25",
          "Faculty": "Prof. Chithra",
        },
        "sub7": {
          "name": "Elective",
          "start": "14:50",
          "end": "15:40",
          "Faculty": "Prof. Chithra",
        },
      },
      "Monday": {
        "sub1": {
          "name": "Elective",
          "start": "8:00",
          "end": "8:50",
          "Faculty": "Prof. Chithra",
        },
        "sub2": {
          "name": "UIT1502 - Principles of Operating Systems",
          "start": "8:50",
          "end": "9:40",
          "Faculty": "Prof. Chithra",
        },
        "sub3": {
          "name": "UIT1504 - Digital Signal Processing",
          "start": "10:05",
          "end": "10:55",
          "Faculty": "Prof. Chithra",
        },
        "sub4": {
          "name": "Elective",
          "start": "10:55",
          "end": "11:45",
          "Faculty": "Prof. Chithra",
        },
        "sub5": {
          "name": "Elective",
          "start": "12:45",
          "end": "13:35",
          "Faculty": "Prof. Chithra",
        },
        "sub6": {
          "name": "Elective",
          "start": "13:35",
          "end": "14:25",
          "Faculty": "Prof. Chithra",
        },
        "sub7": {
          "name": "Elective",
          "start": "14:50",
          "end": "15:40",
          "Faculty": "Prof. Chithra",
        },
      },
      "Tuesday": {
        "sub1": {
          "name": "Elective",
          "start": "8:00",
          "end": "8:50",
          "Faculty": "Prof. Chithra",
        },
        "sub2": {
          "name": "UIT1502 - Principles of Operating Systems",
          "start": "8:50",
          "end": "9:40",
          "Faculty": "Prof. Chithra",
        },
        "sub3": {
          "name": "UIT1504 - Digital Signal Processing",
          "start": "10:05",
          "end": "10:55",
          "Faculty": "Prof. Chithra",
        },
        "sub4": {
          "name": "Elective",
          "start": "10:55",
          "end": "11:45",
          "Faculty": "Prof. Chithra",
        },
        "sub5": {
          "name": "Elective",
          "start": "12:45",
          "end": "13:35",
          "Faculty": "Prof. Chithra",
        },
        "sub6": {
          "name": "Elective",
          "start": "13:35",
          "end": "22:40",
          "Faculty": "Prof. Chithra",
        },
        "sub7": {
          "name": "Elective",
          "start": "23:05",
          "end": "23:40",
          "Faculty": "Prof. Chithra",
        },
      },
      "Wednesday": {
        "sub1": {
          "name": "Elective",
          "start": "8:00",
          "end": "8:50",
          "Faculty": "Prof. Chithra",
        },
        "sub2": {
          "name": "UIT1502 - Principles of Operating Systems",
          "start": "8:50",
          "end": "9:40",
          "Faculty": "Prof. Chithra",
        },
        "sub3": {
          "name": "UIT1504 - Digital Signal Processing",
          "start": "10:05",
          "end": "10:55",
          "Faculty": "Prof. Chithra",
        },
        "sub4": {
          "name": "Elective",
          "start": "10:55",
          "end": "11:45",
          "Faculty": "Prof. Chithra",
        },
        "sub5": {
          "name": "Elective",
          "start": "12:45",
          "end": "13:35",
          "Faculty": "Prof. Chithra",
        },
        "sub6": {
          "name": "Elective",
          "start": "13:35",
          "end": "14:25",
          "Faculty": "Prof. Chithra",
        },
        "sub7": {
          "name": "Elective",
          "start": "14:50",
          "end": "15:40",
          "Faculty": "Prof. Chithra",
        },
      },
      "Thursday": {
        "sub1": {
          "name": "Elective",
          "start": "8:00",
          "end": "8:50",
          "Faculty": "Prof. Chithra",
        },
        "sub2": {
          "name": "UIT1502 - Principles of Operating Systems",
          "start": "8:50",
          "end": "9:40",
          "Faculty": "Prof. Chithra",
        },
        "sub3": {
          "name": "UIT1504 - Digital Signal Processing",
          "start": "10:05",
          "end": "10:55",
          "Faculty": "Prof. Chithra",
        },
        "sub4": {
          "name": "Elective",
          "start": "10:55",
          "end": "11:45",
          "Faculty": "Prof. Chithra",
        },
        "sub5": {
          "name": "Elective",
          "start": "12:45",
          "end": "13:35",
          "Faculty": "Prof. Chithra",
        },
        "sub6": {
          "name": "Elective",
          "start": "13:35",
          "end": "14:25",
          "Faculty": "Prof. Chithra",
        },
        "sub7": {
          "name": "Elective",
          "start": "14:50",
          "end": "15:40",
          "Faculty": "Prof. Chithra",
        },
      },
      "Friday": {
        "sub1": {
          "name": "Elective",
          "start": "8:00",
          "end": "8:50",
          "Faculty": "Prof. Chithra",
        },
        "sub2": {
          "name": "UIT1502 - Principles of Operating Systems",
          "start": "8:50",
          "end": "9:40",
          "Faculty": "Prof. Chithra",
        },
        "sub3": {
          "name": "UIT1504 - Digital Signal Processing",
          "start": "10:05",
          "end": "10:55",
          "Faculty": "Prof. Chithra",
        },
        "sub4": {
          "name": "Elective",
          "start": "10:55",
          "end": "11:45",
          "Faculty": "Prof. Chithra",
        },
        "sub5": {
          "name": "Elective",
          "start": "12:45",
          "end": "13:35",
          "Faculty": "Prof. Chithra",
        },
        "sub6": {
          "name": "Elective",
          "start": "13:35",
          "end": "14:25",
          "Faculty": "Prof. Chithra",
        },
        "sub7": {
          "name": "Elective",
          "start": "14:50",
          "end": "15:40",
          "Faculty": "Prof. Chithra",
        },
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

class Period {
  int? id;
  String? name, faculty;
  Period({required this.id, required this.name, required this.faculty});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['faculty'] = this.faculty;
    return data;
  }

  Period.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    faculty = json['faculty'];
  }
}
