import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ssn_qos/accentColors/main_screen_colors.dart';
import 'package:ssn_qos/screens/attendance_tile.dart';
import 'package:provider/provider.dart';
import 'package:ssn_qos/screens/student.dart';
import 'package:ssn_qos/widgets/GetReminder.dart';
import 'package:ssn_qos/widgets/attendance_bar.dart';
import 'package:ssn_qos/widgets/navigation_drawer.dart';

class home_screeen extends StatefulWidget {
  late double percentage = 0;
  late var username;
  home_screeen({super.key, required this.percentage});

  @override
  State<home_screeen> createState() => _home_screeenState();
}

class _home_screeenState extends State<home_screeen> {
  late double percent = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    percent = widget.percentage;
  }

  var number = 0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> nextScreens = [
    attendance_tile_screen(
      percentage: 0,
    ),
    GetReminder(),
    attendance_tile_screen(
      percentage: 0,
    ),
    attendance_tile_screen(
      percentage: 0,
    ),
    attendance_tile_screen(
      percentage: 0,
    ),
  ];

  List<String> caption = [
    "Total Attendance",
    "Upcoming Class",
    "Reminder",
    "Reminder",
    "Reminder"
  ];
  List<Widget> tiles = [
    attendance_percent_diagram(
      percentage: 0,
      rad: 60,
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
    attendance_percent_diagram(
      percentage: 0.7,
      rad: 40,
    ),
    Text("Upcoming Assignments")
  ];

  @override
  Widget build(BuildContext context) {
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
                              .changeFname("dundun");
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
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 246, 248, 246),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(43))),
              // color: Colors.transparent,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 15,
                  ),
                  Text(
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.08),
                    // "Greetings, Aadhithya!!",
                    Provider.of<Student>(context).fname,
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
                            percent = widget.percentage;

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
                                    Text(caption[index]),
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
