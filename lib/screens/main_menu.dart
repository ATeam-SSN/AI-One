import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:ssn_qos/accentColors/main_screen_colors.dart';
import 'package:ssn_qos/controllers/task_controller.dart';
import 'package:ssn_qos/models/task_model.dart';
import 'package:ssn_qos/screens/attendance_tile.dart';
import 'package:provider/provider.dart';

import 'package:ssn_qos/models/student.dart';
import 'package:ssn_qos/screens/GetReminder.dart';
import 'package:ssn_qos/screens/displayTask.dart';
import 'package:ssn_qos/screens/sample.dart';
import 'package:ssn_qos/screens/timeTable.dart';
import 'package:ssn_qos/screens/updateAttendance.dart';
import 'package:ssn_qos/widgets/NextPeriod.dart';

import 'package:ssn_qos/widgets/ReminderCard.dart';

import 'package:ssn_qos/widgets/attendance_bar.dart';
import 'package:ssn_qos/widgets/custom_button.dart';
import 'package:ssn_qos/widgets/navigation_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssn_qos/app_themes.dart';
import 'package:intl/intl.dart';
import 'package:ssn_qos/widgets/task.dart';

var notification = true;

class home_screeen extends StatefulWidget {
  late double percentage = 0;
  late var username;

  @override
  State<home_screeen> createState() => _home_screeenState();
}

class _home_screeenState extends State<home_screeen> {
  final TaskController _taskController = Get.put(TaskController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var number = 0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> caption = [
    "Total Attendance",
    "Upcoming Class",
    "Reminder",
    "Notification",
  ];

  @override
  Widget build(BuildContext context) {
    int id = 0;
    int flag = 0;

    var NextTask = DateTime.now().add(Duration(hours: 1));
    var initial = DateTime.now();
    print(NextTask.isAtSameMomentAs(initial));
    for (var task in _taskController.tasksList) {
      var formatString = DateFormat('MM/dd/yyyy hh:mm a')
          .parse(task.date.toString() + ' ' + task.startTime.toString());
      print("Task date: $formatString");
      if (DateTime.now().isBefore(formatString)) {
        if (NextTask.isAfter(formatString)) {
          NextTask = formatString;
          id = task.id!;
          flag = 1;
        }
        if (flag == 0) {
          NextTask = formatString;
          id = task.id!;
          flag = 1;
        }
      }
    }
    print(NextTask);
    double AvgPercentage() {
      late double percent = 0;
      int i = 0;
      print(Provider.of<Student>(context).attendance['1']['attended']);
      for (var sub in Provider.of<Student>(context).attendance.keys) {
        i += 1;
        percent += Provider.of<Student>(context).attendance[sub]['attended'] /
            Provider.of<Student>(context).attendance[sub]['total'];
        print("Percent: $percent");
      }
      percent /= i;
      return double.parse(percent.toStringAsFixed(2));
    }

    String GetPeriod(DateTime dTime) {
      String d2 = DateFormat('yyyy-MM-dd').format(dTime);
      // print(d2);
      var keys = Provider.of<Student>(context, listen: false).timetable.keys;
      for (var day in keys) {
        if (DateFormat('EEEE').format(dTime) == day) {
          for (var period in Provider.of<Student>(context, listen: false)
              .timetable[day]
              .keys) {
            String refTimeStart = Provider.of<Student>(context, listen: false)
                    .timetable[day][period]['start'] +
                ':00';
            String refTimeEnd = Provider.of<Student>(context, listen: false)
                    .timetable[day][period]['end'] +
                ':00';

            if (refTimeStart.length == 7) {
              refTimeStart = '0' + refTimeStart;
            }
            if (refTimeEnd.length == 7) {
              refTimeEnd = '0' + refTimeEnd;
            }
            var start = DateTime.parse(d2 + ' ' + refTimeStart);

            var end = DateTime.parse(d2 + ' ' + refTimeEnd);
            if (dTime.isAfter(start) && dTime.isBefore(end)) {
              return Provider.of<Student>(context, listen: false).timetable[day]
                  [period]['name'];
            }
          }
        }
      }
      return " -- -- ";
    }

    SidebarXItem logout = SidebarXItem(
      icon: Icons.logout_rounded,
      label: 'Log out',
      onTap: () {
        var time = DateTime.now();
        print("Logout Successfull at $time");
        FirebaseAuth.instance.signOut();
      },
    );
    List<Widget> tiles = [
      attendance_percent_diagram(
        percentage: AvgPercentage(),
        rad: 60,
      ),
      NextPeriod(
        current: GetPeriod(DateTime.now()),
        next: GetPeriod(DateTime.now().add(Duration(hours: 1))),
      ),
      ReminderCard(
        title: id != 0 ? _taskController.tasksList[id - 1].title : "-----",
        date: id != 0 ? _taskController.tasksList[id - 1].date : "-----",
        time: id != 0 ? _taskController.tasksList[id - 1].startTime : "-----",
      ),
      Icon(
        Icons.notifications_on,
        size: 50,
      ),
      Icon(
        Icons.notifications_off_rounded,
        size: 50,
      )
    ];
    List<Widget> nextScreens = [
      attendance_tile_screen(
        percentage: AvgPercentage(),
      ),
      TimeTableScreen(),
      Reminder(),
      UpdateAttendance()
    ];
    // final user = FirebaseAuth.instance.currentUser!;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: TopDrawer(
          logout: logout,
        ),
        backgroundColor: top_bar_color,
        body:
            // height: 500,
            SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ButtonBar(
                mainAxisSize: MainAxisSize.max,
                alignment: MainAxisAlignment.spaceBetween,
                // buttonPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),

                children: [
                  Container(
                      height: 50,
                      width: 50,
                      child: InkWell(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Icon(
                          Icons.menu_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      )),
                  Container(
                      height: 60,
                      width: 60,
                      child: InkWell(
                          onTap: () {
                            Provider.of<Student>(context, listen: false)
                                .changeFname("Captain");
                          },
                          child: SvgPicture.asset(
                              'assets/images/left_top_x.svg'))),
                  Container(
                      height: 50,
                      width: 50,
                      child: InkWell(
                          onTap: () {},
                          child: Image.asset('assets/images/search_icon.png'))),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                // height: MediaQuery.of(context).size.height,
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 246, 248, 246),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(43))),
                child: Column(
                  children: [
                    Container(
                      height: 15,
                    ),
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        style: AppThemes().WelcomeStyle,
                        // "Greetings, Aadhithya!!",
                        "Welcome Back!\n${Provider.of<Student>(context).fname}",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 25,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        height: MediaQuery.of(context).size.height,
                        child: StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 12,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              if (index == 3) {
                                // print(notification);
                                return Material(
                                  elevation: 4,
                                  color: Colors.white,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: InkWell(
                                    splashColor: Colors.black26,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          caption[index],
                                          style: AppThemes().CaptionStyle,
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        notification
                                            ? tiles[index]
                                            : tiles[index + 1],
                                      ],
                                    )),
                                    onLongPress: () {
                                      if (notification) {
                                        setState(() {
                                          notification = false;
                                        });
                                      } else {
                                        setState(() {
                                          notification = true;
                                        });
                                      }
                                    },
                                    onTap: () {
                                      // print(number);
                                      number += 1;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  nextScreens[index]));

                                      // get_detailsFromFirebase('aadh');
                                    },
                                  ),
                                );
                              }
                              return Material(
                                elevation: 4,
                                color: Colors.white,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                child: InkWell(
                                  splashColor: Colors.black26,
                                  child: Center(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        caption[index],
                                        style: AppThemes().CaptionStyle,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      tiles[index],
                                    ],
                                  )),
                                  onTap: () {
                                    // print(number);
                                    number += 1;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                nextScreens[index]));

                                    // get_detailsFromFirebase('aadh');
                                  },
                                ),
                              );
                            },
                            staggeredTileBuilder: (index) {
                              // print(index);
                              if (index == 3) {
                                return StaggeredTile.count(2, 1);
                              }
                              return StaggeredTile.count(
                                  1, index.isEven ? 1 : 2);
                            }),
                      ),
                    ),
                    Text("Contact us on"),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
