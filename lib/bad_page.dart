import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class attendence_screen extends StatefulWidget {
  const attendence_screen({super.key});

  @override
  State<attendence_screen> createState() => _attendence_screenState();
}

class _attendence_screenState extends State<attendence_screen> {
  int _counter = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void onTap() {}

  Widget _icon(IconData icon, {Color color = Colors.blue}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Colors.blue,
        // color: Theme.of(context).backgroundColor,
        //boxShadow: AppTheme.shadow
      ),
      child: InkWell(
        onTap: () {
          _key.currentState?.openDrawer();
        },
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }

  bool isHomePageSelected = true;
  Widget _appBar() {
    return Container(
      color: Colors.blue,

      //padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.menu, color: Color.fromARGB(135, 4, 4, 4)),
          ),
          Container(
              alignment: Alignment.center,
              width: 30,
              height: 40,
              child: Text("data"))
          //  RotatedBox(

          // quarterTurns: 4,
          // child: SvgPicture.asset('assets/images/vector.svg'),
          // ),
          // ),
          // Container(
          //   width: 30,
          //   height: 40,
          //   alignment: Alignment.center,
          //   child: Text("hello"),
          // )
          // ClipRRect(
          //   borderRadius: BorderRadius.all(Radius.circular(13)),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Theme.of(context).backgroundColor,
          //       boxShadow: <BoxShadow>[
          //         BoxShadow(
          //             color: Color.fromARGB(255, 146, 55, 55),
          //             blurRadius: 10,
          //             spreadRadius: 10),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 dashboard_test
        key: _key,
        appBar: AppBar(
          leading: _appBar(),
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            // Card(
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       const ListTile(
            //         leading: Icon(Icons.menu_book),
            //         title: Text('Attendence inga'),
            //         subtitle: Text('Attendence related data and management'),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           TextButton(
            //             child: const Text('ADD TIMETABLE'),
            //             onPressed: () {/* ... */},
            //           ),
            //           const SizedBox(width: 8),
            //           TextButton(
            //             child: const Text('SET TIMING'),
            //             onPressed: () {/* ... */},
            //           ),
            //           const SizedBox(width: 8),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ));

      appBar: AppBar(
        title: Text("AiOne"),
      ),
    );
main
  }
}
