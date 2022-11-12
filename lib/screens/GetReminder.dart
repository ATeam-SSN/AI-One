import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ssn_qos/screens/add_tasks.dart';
import 'package:ssn_qos/screens/blank_template.dart';
import 'package:ssn_qos/services/student_details.dart';
import 'package:ssn_qos/widgets/ReminderCard.dart';

class GetReminder extends StatefulWidget {
  const GetReminder({super.key});
// FirebaseUser user = FirebaseAuth.instance.currentUser;
  @override
  State<GetReminder> createState() => _GetReminderState();
}

class _GetReminderState extends State<GetReminder> {
  int docLength = 0;
  var username;
  void GetDocLength() async {
    var n = 0;
    FirebaseOPS firebaseOps = FirebaseOPS();
    DocumentSnapshot<Map<String, dynamic>> firebaseData =
        await firebaseOps.getStudentInfo();
  }

  @override
  void initState() {
    // TODO: implement initState
    GetDocLength();
    print("Length of reminder list: $docLength");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: BlankScreen(
        child: Column(
          children: [
            Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    child: Icon(Icons.add_alert_rounded),
                    onPressed: () {
                      AddTask();
                    }))
          ],
        ),
        //     child: StreamBuilder(
        //   stream: FirebaseFirestore.instance
        //       .collection('users')
        //       .doc('abhishek2010637@ssn.edu.in')
        //       .snapshots(),
        //   builder: (context, snapshot) {
        //     print("$snapshot");
        //     if (!snapshot.hasData) return CircularProgressIndicator();
        //     return ListView.builder(
        //         itemExtent: 80,
        //         itemCount: 5,
        //         itemBuilder: ((context, index) => ReminderCard(text: "yoyo")));
        //   },
        // )),
      ),
    );
  }
}
