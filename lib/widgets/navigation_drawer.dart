import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:ssn_qos/accentColors/main_screen_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssn_qos/models/student.dart';
import 'package:ssn_qos/screens/attendance_tile.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'package:ssn_qos/screens/timeTable.dart';

final divider = Divider(color: white.withOpacity(0.5), height: 2);

class TopDrawer extends StatefulWidget {
  late var logout;
  TopDrawer({super.key, required this.logout});

  @override
  State<TopDrawer> createState() => _TopDrawerState();
}

class _TopDrawerState extends State<TopDrawer> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  @override
  Widget build(BuildContext context) {
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

    return SidebarX(
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
          borderRadius: BorderRadius.circular(20),
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
            Navigator.pop(context);
          },
        ),
        SidebarXItem(
          icon: Icons.book_rounded,
          label: 'Attendance',
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => attendance_tile_screen(
                          percentage: AvgPercentage(),
                        )));
          },
        ),
        SidebarXItem(
          icon: Icons.share_arrival_time_outlined,
          label: 'TimeTable',
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TimeTableScreen()));
          },
        ),
        const SidebarXItem(
          icon: Icons.notifications_rounded,
          label: 'Reminder',
        ),
        widget.logout,
      ],
    );
  }
}
