import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssn_qos/models/student.dart';
import 'package:ssn_qos/screens/blank_template.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:intl/intl.dart';

List colors = [
  0x4eed81,
  0xff648e9a,
  0xFFFF80A6,
  0xff8c0335,
  0xFF3699EC,
  0xff103b40,
  0xff648e9a,
  0xFFFFC04E,
];

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  // late final SwipableStackController _controller;
  final controller = SwipableStackController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> allTimeTable =
        Provider.of<Student>(context, listen: false).timetable;
    print(allTimeTable.keys.length);
    String GetPeriod(DateTime Time) {
      var keys = Provider.of<Student>(context, listen: false).timetable.keys;
      for (var day in keys) {
        if (DateFormat('EEEE').format(Time) == day) {
          for (var period in Provider.of<Student>(context, listen: false)
              .timetable[day]
              .keys) {
            var start = Provider.of<Student>(context, listen: false)
                .timetable[day][period]['start']
                .toDate();
            var end = Provider.of<Student>(context, listen: false)
                .timetable[day][period]['end']
                .toDate();
            if (Time.isAfter(start) && Time.isBefore(end)) {
              return Provider.of<Student>(context, listen: false).timetable[day]
                  [period]['name'];
            }
          }
        }
      }
      return " -- -- ";
    }

    return SafeArea(
      top: true,
      child: BlankScreen(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SwipableStack(
                  detectableSwipeDirections: const {
                    SwipeDirection.right,
                    SwipeDirection.left,
                    SwipeDirection.down,
                    SwipeDirection.up
                  },
                  onWillMoveNext: (index, direction) {
                    final allowedActions = [
                      SwipeDirection.right,
                      SwipeDirection.left,
                      SwipeDirection.up,
                      SwipeDirection.down,
                    ];
                    return allowedActions.contains(direction);
                  },
                  controller: controller,
                  stackClipBehaviour: Clip.antiAliasWithSaveLayer,
                  onSwipeCompleted: (index, direction) {
                    if (kDebugMode) {
                      print('$index, $direction');
                    }
                  },
                  horizontalSwipeThreshold: 0.4,
                  verticalSwipeThreshold: 0.4,
                  builder: (context, properties) {
                    final itemIndex =
                        properties.index % allTimeTable.keys.length;

                    return Builder(builder: (context) {
                      return Stack(children: [
                        Positioned(
                          left: MediaQuery.of(context).size.width / 6,
                          top: MediaQuery.of(context).size.height / 6,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.height / 3,
                            child: Center(child: Text("Hoorish$itemIndex")),
                            decoration: BoxDecoration(
                                color: Color(colors[itemIndex]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ]);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
