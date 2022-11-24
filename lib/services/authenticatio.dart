import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssn_qos/models/student.dart';
import 'package:ssn_qos/screens/login_screen.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'package:ssn_qos/screens/signup_screen.dart';

import '../widgets/attendance_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    void SetTimeTable() {
      final referStudent = FirebaseFirestore.instance.collection('users');
      referStudent.doc("aadh").set({
        // "attd": AllSubjects(Provider.of<Student>(context).dept),
        "timtable": GetTimeTable(Provider.of<Student>(context).dept,
            Provider.of<Student>(context).section)
      }, SetOptions(merge: true));
    }

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong :("),
            );
          }
          if (snapshot.hasData) {
            print("Login Successful");
            SetTimeTable();
            return home_screeen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
