import 'package:flutter/material.dart';

import 'package:ssn_qos/accentColors/main_screen_colors.dart';
import 'package:ssn_qos/screens/blank_template.dart';
import 'package:ssn_qos/screens/updateAttendance.dart';
import 'package:ssn_qos/widgets/attendance_bar.dart';

class attendance_tile_screen extends StatefulWidget {
  late double percentage;
  attendance_tile_screen({super.key, required this.percentage});
  @override
  State<attendance_tile_screen> createState() => _attendance_tile_screenState();
}

class _attendance_tile_screenState extends State<attendance_tile_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: SafeArea(
        top: true,
        child: BlankScreen(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 248, 246),
                borderRadius: BorderRadius.all(Radius.circular(43.0))),
            child: Column(
              children: [
                Container(
                  height: 50,
                ),
                attendance_percent_diagram(
                    percentage: widget.percentage, rad: 80),
                SizedBox(
                  height: 30,
                ),
                IndividualCourse(),
                // SizedBox(
                //   height: 150,
                // ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: top_bar_color,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0))),
                  child: IconButton(
                    icon: Icon(Icons.arrow_upward_rounded),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SafeArea(
                                  top: true, child: UpdateAttendance())));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
