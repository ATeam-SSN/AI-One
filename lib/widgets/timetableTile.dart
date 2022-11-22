// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ssn_qos/app_themes.dart';

class TimeTableTile extends StatelessWidget {
  final int strike;
  final String subject_name;
  const TimeTableTile(
      {super.key, required this.subject_name, required this.strike});

  @override
  Widget build(BuildContext context) {
    if (strike == 0) {
      return Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: (0.08 * MediaQuery.of(context).size.height).toDouble(),
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // color: Color.fromARGB(255, 225, 84, 84),
            ),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  subject_name,
                  style: AppThemes().subjectStyle,
                ),
              ),
            ),
          )
        ],
      );
    } else {
      return Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: (0.08 * MediaQuery.of(context).size.height).toDouble(),
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // color: Color.fromARGB(255, 225, 84, 84),
            ),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  subject_name,
                  style: AppThemes().strikedsubjectStyle,
                ),
              ),
            ),
          )
        ],
      );
    }
  }
}

class DayTile extends StatelessWidget {
  final String subject_name;
  const DayTile({super.key, required this.subject_name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SizedBox(
        //   width: 10,
        // ),
        Container(
          // padding: EdgeInsets.all(5),
          height: (0.12 * MediaQuery.of(context).size.height).toDouble(),
          width: MediaQuery.of(context).size.width * 0.73,
          // width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(0.0, 0.0), // shadow direction: bottom right
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(255, 225, 84, 84),
          ),
          child: Container(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Text(
                subject_name,
                style: AppThemes().DayStyle,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class TimeTile extends StatelessWidget {
  final String time;
  const TimeTile({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (0.07 * MediaQuery.of(context).size.height).toDouble(),
      width: 50,
      decoration: BoxDecoration(
        // ignore: prefer_const_literals_to_create_immutables
        // boxShadow: [
        //   BoxShadow(
        //     color: Color.fromARGB(255, 226, 240, 233),
        //     offset: const Offset(
        //       5.0,
        //       5.0,
        //     ),
        //     blurRadius: 10.0,
        //     spreadRadius: 2.0,
        //   ), //BoxShadow
        //   BoxShadow(
        //     color: Colors.white,
        //     offset: const Offset(0.0, 0.0),
        //     blurRadius: 0.0,
        //     spreadRadius: 0.0,
        //   ), //BoxShadow
        // ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Center(
        child: Text(
          time,
          style: AppThemes().timeStyle,
        ),
      ),
    );
  }
}
