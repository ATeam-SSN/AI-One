import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ssn_qos/app_themes.dart';
import 'package:ssn_qos/screens/blank_template.dart';
import 'package:ssn_qos/screens/main_menu.dart';
import 'package:intl/intl.dart';

var tips;
void getTipOfTheDay2() async {
  final referStudent = FirebaseFirestore.instance.collection('HealthTips');
  print(referStudent.doc(DateFormat('EEEE').format(DateTime.now())).get());
  tips =
      await referStudent.doc(DateFormat('EEEE').format(DateTime.now())).get();
  // print(tip.toString());
}

class NutritionScreen extends StatefulWidget {
  var healthTip;
  NutritionScreen({super.key, required healthTip});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  @override
  Widget build(BuildContext context) {
    getTipOfTheDay2();

    var WIDTH = MediaQuery.of(context).size.width;
    var HEIGHT = MediaQuery.of(context).size.height;

    return SafeArea(
      child: BlankScreen(
          child: Container(
              width: WIDTH,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      tips.get("1")['desc'],
                      style: AppThemes().RegisterStyle1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(43))),
                        child: Image.network(tips.get("1")['img'])),
                    SingleChildScrollView(
                      child: Material(
                        elevation: 4,
                        color: Colors.white,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: InkWell(
                          splashColor: Colors.black26,
                          child: Center(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Additional Info",
                                style: AppThemes().CaptionStyle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(tips.get("1")['addl'])),
                            ],
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
