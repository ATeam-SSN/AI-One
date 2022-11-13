import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ssn_qos/accentColors/main_screen_colors.dart';
import 'package:ssn_qos/screens/attendance_tile.dart';
import 'package:provider/provider.dart';
 
import 'package:ssn_qos/models/student.dart';
import 'package:ssn_qos/screens/GetReminder.dart';
import 'package:ssn_qos/screens/displayTask.dart';
import 'package:ssn_qos/widgets/NextPeriod.dart';
 
import 'package:ssn_qos/widgets/attendance_bar.dart';
import 'package:ssn_qos/widgets/navigation_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssn_qos/accentColors/app_themes.dart';
import 'package:intl/intl.dart';

class home_screeen extends StatefulWidget {
  late double percentage = 0;
  late var username;

  @override
  State<home_screeen> createState() => _home_screeenState();
}

class _home_screeenState extends State<home_screeen> {
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
    "Reminder",
    "Reminder"
  ];

  @override
  Widget build(BuildContext context) {
    var Days = {
      1: "Monday",
      2: "Tuesday",
      3: "Wednesday",
      4: "Thursday",
      5: "Friday",
      6: "Saturday",
      7: "Sunday",
    };
    double AvgPercentage() {
      late double percent = 0;
      int i = 0;
      for (var sub in Provider.of<Student>(context).attendance.keys) {
        i += 1;
        percent += Provider.of<Student>(context).attendance[sub]['attended'] /
            Provider.of<Student>(context).attendance[sub]['total'];
      }
      percent /= i;
      return double.parse(percent.toStringAsFixed(2));
    }

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

    List<Widget> tiles = [
      attendance_percent_diagram(
        percentage: AvgPercentage(),
        rad: 60,
      ),
      NextPeriod(
        current: GetPeriod(DateTime.now()),
        next: GetPeriod(DateTime.now().subtract(Duration(hours: 1))),
      ),
      attendance_percent_diagram(
        percentage: 0.7,
        rad: 40,
      ),
      attendance_percent_diagram(
        percentage: 0.7,
        rad: 40,
      ),
      attendance_percent_diagram(
        percentage: 0.7,
        rad: 40,
      ),
      Text("Upcoming Assignments")
    ];
    List<Widget> nextScreens = [
      attendance_tile_screen(
        percentage: AvgPercentage(),
      ),
      GetReminder(),
      attendance_tile_screen(
        percentage: 0,
      ),
      DisplayTask(),
      attendance_tile_screen(
        percentage: 0,
      ),
    ];
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      key: _scaffoldKey,
      drawer: TopDrawer(),
      backgroundColor: top_bar_color,
      body:
          // height: 500,
          SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 55,
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
                          GetPeriod(DateTime.now());
                          GetPeriod(DateTime.now().add(Duration(hours: 1)));
                        },
                        child:
                            SvgPicture.asset('assets/images/left_top_x.svg'))),
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
                  Text(
                    style: AppThemes().WelcomeStyle,
                    // "Greetings, Aadhithya!!",
                    "Welcome Back!\n${Provider.of<Student>(context).fname}",
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
                          itemCount: 5,
                          itemBuilder: (context, index) {
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
                                  print(number);
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
                            return StaggeredTile.count(
                                1, index.isEven ? 1.2 : 1.8);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
