import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssn_qos/app_themes.dart';
import 'package:ssn_qos/models/student.dart';
import 'package:ssn_qos/screens/blank_template.dart';
import 'package:ssn_qos/services/notification_helper.dart';
import 'package:ssn_qos/widgets/timetableTile.dart';

import 'package:intl/intl.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

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
List Subjects = [];
List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
List<Widget> allDays = [
  TimeTable(day: 'Monday'),
  TimeTable(day: 'Tuesday'),
  TimeTable(day: 'Wednesday'),
  TimeTable(day: 'Thursday'),
  TimeTable(day: 'Friday'),
];
int _curr = 0;
var notifyHelper = NotificationHelper();

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  // late final SwipableStackController _controller;

  Duration pageTurnDuration = Duration(milliseconds: 500);
  Curve pageTurnCurve = Curves.ease;
  late PageController _pageController = PageController(
      initialPage: days.indexOf(DateFormat('EEEE').format(DateTime.now())));
  @override
  void initState() {
    notifyHelper.initNotification();
    notifyHelper.requestIOSPermission();
    _pageController = PageController();
    super.initState();
    // The PageController allows us to instruct the PageView to change pages.
  }

  void _goForward() {
    _pageController.nextPage(duration: pageTurnDuration, curve: pageTurnCurve);
  }

  void _goBack() {
    _pageController.previousPage(
        duration: pageTurnDuration, curve: pageTurnCurve);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> allTimeTable =
        Provider.of<Student>(context, listen: false).timetable;
    for (var t in allTimeTable['Monday'].keys) {
      Subjects.add(t);
    }
    Subjects.sort();
    Subjects = Subjects.toSet().toList();

    print(Subjects);
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

    var day = DateFormat('EEEE').format(DateTime.now());
    print(day);
    print(Subjects.length);
    int start = 0;
    return SafeArea(
      top: true,
      child: BlankScreen(
          child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.11 * MediaQuery.of(context).size.height,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          // padding: EdgeInsets.all(2),
                          itemCount: Subjects.length + 1,
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                                thickness: 0,
                                color: Color.fromARGB(255, 255, 255, 255),
                                // thickness: 2,
                              ),
                          itemBuilder: (context, index) {
                            if (index == Subjects.length) {
                              return TimeTile(
                                  time: allTimeTable[day]
                                      [Subjects[Subjects.length - 1]]['end']);
                            } else {
                              return TimeTile(
                                  time: allTimeTable[day][Subjects[index]]
                                      ['start']);
                            }
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: (0.73 * MediaQuery.of(context).size.height),
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: GestureDetector(
                    // Using the DragEndDetails allows us to only fire once per swipe.
                    onHorizontalDragEnd: (dragEndDetails) {
                      if (dragEndDetails.primaryVelocity! < 0) {
                        // Page forwards
                        print('Move page forwards');
                        _goForward();
                      } else if (dragEndDetails.primaryVelocity! > 0) {
                        // Page backwards
                        print('Move page backwards');
                        _goBack();
                      }
                    },
                    child: PageView.builder(
                        // itemCount: allDays.length,
                        controller: _pageController,
                        // NeverScrollableScrollPhysics disables PageView built-in gestures.
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return allDays[index % allDays.length];
                        }),
                  ),
                ),
//                 PageView.builder(
//   itemCount: allDays.length,
//   controller: controller,
//   itemBuilder: (context, position) {

//   },
// )
                // allDays[0],
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class TimeTable extends StatelessWidget {
  final String day;
  const TimeTable({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> allTimeTable =
        Provider.of<Student>(context, listen: false).timetable;
    var notifyHelper;
    return Expanded(
      child: Container(
        // padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 232, 195, 82),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(1.0, 1.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Column(
          children: [
            DayTile(subject_name: day),
            ListView.separated(
                shrinkWrap: true,
                itemCount: Subjects.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      height: 4,
                      thickness: 5,
                      indent: 10,
                      endIndent: 10,
                    ),
                itemBuilder: (context, index) {
                  String d2 = DateFormat('yyyy-MM-dd').format(DateTime.now());
                  if (DateFormat('EEEE').format(DateTime.now()) == day) {
                    for (var periods
                        in Provider.of<Student>(context, listen: false)
                            .timetable[day]
                            .keys) {
                      String refTimeStart =
                          Provider.of<Student>(context, listen: false)
                                  .timetable[day][Subjects[index]]['start'] +
                              ':00';
                      String refTimeEnd =
                          Provider.of<Student>(context, listen: false)
                                  .timetable[day][Subjects[index]]['end'] +
                              ':00';
                      if (refTimeStart.length == 7) {
                        refTimeStart = '0' + refTimeStart;
                      }
                      if (refTimeEnd.length == 7) {
                        refTimeEnd = '0' + refTimeEnd;
                      }
                      var start = DateTime.parse(d2 + ' ' + refTimeStart);
                      var end = DateTime.parse(d2 + ' ' + refTimeEnd);

                      if (DateTime.now().isAfter(end)) {
                        return TimeTableTile(
                          subject_name: allTimeTable[day][Subjects[index]]
                              ['name'],
                          strike: 1,
                        );
                      } else if (DateTime.now().isBefore(start)) {
                        Period period = Period(
                            id: index,
                            name: allTimeTable[day][Subjects[index]]['name'],
                            faculty: allTimeTable[day][Subjects[index]]
                                ['faculty']);
                        String time =
                            Provider.of<Student>(context, listen: false)
                                .timetable[day][Subjects[index]]['start'];
                        if (time.length == 4) {
                          time = '0' + time;
                        }
                        notifyHelper.scheduledClassNotification(
                            hour: int.parse(time.split(":")[0]),
                            minute: (int.parse(time.split(":")[1]) - 5).abs(),
                            period: period);
                        return TimeTableTile(
                          subject_name: allTimeTable[day][2]['name'],
                          strike: 0,
                        );
                      }
                    }
                  }

                  return TimeTableTile(
                    subject_name: allTimeTable[day][Subjects[index]]['name'],
                    strike: 0,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
