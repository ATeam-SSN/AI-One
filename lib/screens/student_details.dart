import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'student.dart';
import 'dart:async';

class getStudentDetails extends StatefulWidget {
  const getStudentDetails({super.key});

  @override
  State<getStudentDetails> createState() => _getStudentDetailsState();
}

class _getStudentDetailsState extends State<getStudentDetails> {
  String id = "aadhithya2010747";
  var _referStudent = FirebaseFirestore.instance.collection('users');
  late Stream<QuerySnapshot> _streamData;
  late Student StudDetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamData = _referStudent.snapshots();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => home_screeen(
                    // allData: StudDetails,
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _streamData,
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.active)
                  ? SizedBox(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                            StudDetails.fname = data['fname'];
                            StudDetails.lname = data['lname'];
                            StudDetails.dept = data['Dept'];
                            return Text(StudDetails.dept);
                          }),
                    )
                  : Container(
                      color: Colors.amber,
                      child: Center(child: CircularProgressIndicator()),
                    );
            }));
  }
}
