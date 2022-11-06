import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ssn_qos/accentColors/main_screen_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:ssn_qos/screens/attendance_tile.dart';

const primaryColor = Colors.white;
const canvasColor = Color.fromARGB(255, 28, 165, 46);
// const scaffoldBackgroundColor = top_bar_color;
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
const actionColor = Color(0xFF5F5FA7);

final divider = Divider(color: white.withOpacity(0.3), height: 1);

class attendance_percent_diagram extends StatelessWidget {
  final double percent;
  final double rad;
  const attendance_percent_diagram(
      {super.key, required this.percent, required this.rad});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: rad,
      lineWidth: 13.0,
      animation: true,
      percent: percent / 100,
      center: new Text(
        // ignore: prefer_interpolation_to_compose_strings
        percent.toString() + "%",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      // footer: new Text(
      //   "Sales this week",
      //
      // ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Color.fromARGB(255, 169, 130, 15),
    );
  }
}

List<Widget> nextScreens = [
  attendance_tile_screen(),
  attendance_tile_screen(),
  attendance_tile_screen(),
  attendance_tile_screen(),
  attendance_tile_screen(),
];

List<String> caption = [
  "Total Attendance",
  "Upcoming Class",
  "Reminder",
  "Reminder",
  "Reminder"
];
List<Widget> tiles = [
  attendance_percent_diagram(percent: 30.4, rad: 80),
  attendance_percent_diagram(percent: 30.4, rad: 12),
  attendance_percent_diagram(percent: 30.4, rad: 12),
  attendance_percent_diagram(percent: 30.4, rad: 12),
  Text("Upcoming Assignments")
];

class home_screeen extends StatefulWidget {
  // student allData;
  // home_screeen({this.allData});

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
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SidebarX(
        controller: _controller,
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: const TextStyle(color: Colors.white),
          selectedTextStyle: const TextStyle(color: Colors.white),
          itemTextPadding: const EdgeInsets.only(left: 30),
          selectedItemTextPadding: const EdgeInsets.only(left: 30),
          itemDecoration: BoxDecoration(
            border: Border.all(color: top_bar_color),
          ),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: actionColor.withOpacity(0.37),
            ),
            gradient: LinearGradient(
              colors: [accentCanvasColor, top_bar_color],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.28),
                blurRadius: 30,
              )
            ],
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 20,
          ),
        ),
        extendedTheme: SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: top_bar_color,
          ),
          margin: EdgeInsets.only(right: 10),
        ),
        footerDivider: divider,
        headerBuilder: (context, extended) {
          return SafeArea(
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/images/avatar.png'),
              ),
            ),
          );
        },
        items: [
          SidebarXItem(
            icon: Icons.home,
            label: 'Home',
            onTap: () {
              debugPrint('Hello');
            },
          ),
          const SidebarXItem(
            icon: Icons.search,
            label: 'Search',
          ),
          const SidebarXItem(
            icon: Icons.people,
            label: 'People',
          ),
          const SidebarXItem(
            icon: Icons.favorite,
            label: 'Favorites',
          ),
        ],
      ),
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
                    child: FlatButton(
                        splashColor: Colors.black26,
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Icon(
                          Icons.menu_rounded,
                          size: 40,
                          color: Colors.white,
                        ))),
                Container(
                    height: 60,
                    width: 60,
                    child: FlatButton(
                        onPressed: null,
                        child:
                            SvgPicture.asset('assets/images/left_top_x.svg'))),
                Container(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        onPressed: null,
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
                    "Greetings, Aadhithya!!",
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
