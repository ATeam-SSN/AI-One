import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'package:ssn_qos/screens/student_details.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// import 'package:firebase_cras';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: SafeArea(top: true, child: home_screeen()),
    );
  }
}
