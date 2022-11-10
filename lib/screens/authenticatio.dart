import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ssn_qos/screens/login_screen.dart';
import 'package:ssn_qos/screens/main_menu.dart';

import '../widgets/attendance_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double attendance_percent = 0;
  Future PercentageCall() async {
    var result = await getAggregateAttendance();
    print(result);
    var i = 0;
    for (final MapEntry in result.entries) {
      attendance_percent = attendance_percent + MapEntry.value;
      i += 1;
    }
    attendance_percent /= i;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            print("Login Successful");
            PercentageCall();
            return home_screeen(
              percentage: attendance_percent,
            );
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
