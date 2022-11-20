import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:ssn_qos/services/student_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssn_qos/models/student.dart';
import 'package:ssn_qos/app_themes.dart';

class IndividualCourse extends StatefulWidget {
  const IndividualCourse({super.key});

  @override
  State<IndividualCourse> createState() => _IndividualCourseState();
}

class _IndividualCourseState extends State<IndividualCourse> {
  @override
  Widget build(BuildContext context) {
    List<Color> listcolors = [
      Color.fromARGB(255, 164, 47, 141),
      Color.fromARGB(255, 194, 199, 55),
      Color.fromARGB(255, 20, 178, 235),
      Color.fromARGB(255, 201, 137, 40)
    ];

    var attendance = Provider.of<Student>(context).attendance;
    print(attendance);
    Map<int, dynamic> Attendance = {};
    int i = 0;
    for (var course in attendance.keys) {
      Attendance[i] = attendance[course];
      i++;
    }

    return Container(
      child: Expanded(
        child: ListView.builder(
            itemCount: i,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${Attendance[index]['name']}",
                        style: AppThemes().CourseStyle,
                      ),
                    ),
                    LinearPercentIndicator(
                      barRadius: Radius.circular(14),
                      animation: true,
                      center: Text("hello"),
                      backgroundColor: Colors.transparent,
                      progressColor: listcolors[index],
                      restartAnimation: true,
                      lineHeight: 20,
                      percent: Attendance[index]['attended'] /
                          Attendance[index]['total'],
                    )
                  ],
                ),
              );
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
  Map<String, double> course_wise_Attendance = {};

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
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Color.fromARGB(255, 169, 130, 15),
    );
  }
}
