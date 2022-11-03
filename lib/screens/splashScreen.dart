import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'package:ssn_qos/screens/student_details.dart';

class Splashscreen extends StatelessWidget {
  int? duration = 5;
  @override
  Widget build(BuildContext context) {
    StudentDetails? studet;
    Future.delayed(Duration(seconds: this.duration!), () async {
      FirebaseApp app = await Firebase.initializeApp();

      studet!.get_detailsFromFirebase().then((value) => null);
    });

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
  }
}
