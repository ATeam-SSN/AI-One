import 'package:flutter/material.dart';
import 'package:ssn_qos/app_themes.dart';
import 'dart:math';

import 'package:ssn_qos/widgets/bullet.dart';

class ReminderCard extends StatelessWidget {
  late var title, date, time;
  ReminderCard(
      {super.key, required this.title, required this.date, required this.time});
  List<Color> AllColors = [
    Color.fromARGB(255, 230, 200, 108),
    Color.fromARGB(255, 152, 179, 218),
    Color.fromARGB(255, 188, 146, 231),
    Color.fromARGB(255, 180, 179, 175),
    Color.fromARGB(255, 152, 243, 243),
  ];
  Color giveRandomColor() {
    Random rnd = new Random();
    var element = AllColors[rnd.nextInt(AllColors.length)];
    print(element);
    return element;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: giveRandomColor(),
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                title,
                style: AppThemes().ReminderStyle,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Date: $date",
              style: AppThemes().ReminderDateStyle,
            ),
            Text(
              "Time: $time",
              style: AppThemes().ReminderDateStyle,
            ),
          ],
        ),
      ),
    );
  }
}
