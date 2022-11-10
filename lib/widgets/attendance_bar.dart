import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ssn_qos/screens/student_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, double>> getAggregateAttendance() async {
  Map<String, double> course_wise_Attendance = {};

  FirebaseOPS firebaseOps = FirebaseOPS();
  DocumentSnapshot<Map<String, dynamic>> firebaseData =
      await firebaseOps.getStudentInfo();
  var attendance = firebaseData.get("attd");

  for (var course in attendance.keys) {
    course_wise_Attendance[attendance[course]['name']] =
        attendance[course]['attended'] / attendance[course]['total'];
  }
  print(course_wise_Attendance);
  return await course_wise_Attendance;
}

class IndividualCourse extends StatefulWidget {
  const IndividualCourse({super.key});

  @override
  State<IndividualCourse> createState() => _IndividualCourseState();
}

class _IndividualCourseState extends State<IndividualCourse> {
  var i = 0;
  Future<Map<String, double>> getAggregateAttendance() async {
    Map<String, double> course_wise_Attendance = {};

    FirebaseOPS firebaseOps = FirebaseOPS();
    DocumentSnapshot<Map<String, dynamic>> firebaseData =
        await firebaseOps.getStudentInfo();
    var attendance = firebaseData.get("attd");

    for (var course in attendance.keys) {
      i += 1;
      course_wise_Attendance[attendance[course]['name']] =
          attendance[course]['attended'] / attendance[course]['total'];
    }
    print(course_wise_Attendance);
    return await course_wise_Attendance;
  }

  Map<String, double> Attendance = {};
  void getAttendance() async {
    var list = await getAggregateAttendance();

    for (final MapEntry in list.entries) {
      Attendance[MapEntry.key] = MapEntry.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
            itemCount: i,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: const Icon(Icons.list),
                  trailing: const Text(
                    "GFG",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text("List item $index"));
            }),
      ),
    );
  }
}

class attendance_percent_diagram extends StatefulWidget {
  final double rad, percentage;
  const attendance_percent_diagram(
      {super.key, required this.percentage, required this.rad});

  @override
  State<attendance_percent_diagram> createState() =>
      _attendance_percent_diagramState();
}

class _attendance_percent_diagramState
    extends State<attendance_percent_diagram> {
  @override
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: widget.rad,
      lineWidth: 13.0,
      animation: true,
      percent: double.parse(widget.percentage.toStringAsFixed(2)),
      center: new Text(
        // ignore: prefer_interpolation_to_compose_strings
        (double.parse(widget.percentage.toStringAsFixed(2)) * 100).toString() +
            "%",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      // footer: new Text(
      //   "Sales this week",
      //
      // ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Color.fromARGB(255, 169, 130, 15),
    );
  }
}
