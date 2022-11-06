import 'package:cloud_firestore/cloud_firestore.dart';
import 'student.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'package:ssn_qos/screens/student_details.dart';

class Splashscreen extends StatelessWidget {
  int? duration = 5;
  String id = "aadhithya2010747";
  late student StudDetails;
  var _streamData = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _streamData,
            builder: (context, snapshot) {
              return SizedBox(
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index].data()
                          as Map<String, dynamic>;
                      StudDetails.fname = data['fname'];
                      StudDetails.lname = data['lname'];
                      StudDetails.dept = data['Dept'];
                      return Container(
                        color: Colors.blueAccent,
                        child: SplashScreen(
                          seconds: this.duration,
                          title: Text(
                            'AI - One',
                            textScaleFactor: 2,
                          ),
                          image: Image.asset('assets/images/left_top_x.png'),
                          loaderColor: Colors.white,
                          navigateAfterSeconds: home_screeen(),
                        ),
                      );
                    }),
              );
            }));
  }
}