import 'package:flutter/material.dart';
import 'dart:math';

import 'package:ssn_qos/widgets/bullet.dart';

class ReminderCard extends StatelessWidget {
  late var text = "Nothing";
  ReminderCard({super.key, required this.text});
  List<Color> AllColors = [
    Colors.black38,
    Color.fromARGB(255, 173, 139, 38),
    Color.fromARGB(255, 30, 83, 158),
    Color.fromARGB(255, 120, 58, 183),
    Color.fromARGB(255, 173, 139, 38),
    Color.fromARGB(255, 173, 89, 46),
  ];
  Color giveRandomColor() {
    Random rnd = new Random();
    var element = AllColors[rnd.nextInt(AllColors.length)];
    return element;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        tileColor: giveRandomColor(),
        leading: MyBullet(),
        title: Text(text),
      ),
    );
  }
}
