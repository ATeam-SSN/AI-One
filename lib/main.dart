import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:ssn_qos/services/authenticatio.dart';
import 'package:ssn_qos/screens/login_screen.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'package:ssn_qos/models/student.dart';
import 'package:ssn_qos/services/student_details.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:ssn_qos/services/utils.dart';

import 'database_service/sql_service.dart';

// import 'package:firebase_cras';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlServices.initDatabase();
  await GetStorage.init();
  await Firebase.initializeApp();
  FirebaseOPS firebaseOps = FirebaseOPS();
  // final referStudent =
  //     FirebaseFirestore.instance.collection('users').doc('aadh').toString();
  // print(referStudent);
  DocumentSnapshot<Map<String, dynamic>> firebaseData =
      await firebaseOps.getStudentInfo();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(ChangeNotifierProvider(
      create: (context) => firebaseOps.setStudentInfo(firebaseData),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: SafeArea(top: true, child: MainPage()),
    );
  }
}
