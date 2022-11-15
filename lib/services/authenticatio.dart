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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Login Successful");

            return home_screeen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
