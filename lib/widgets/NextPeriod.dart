import 'package:flutter/material.dart';
import 'package:ssn_qos/app_themes.dart';

class NextPeriod extends StatefulWidget {
  var current;
  var next;
  NextPeriod({super.key, this.current, this.next});

  @override
  State<NextPeriod> createState() => _NextPeriodState();
}

class _NextPeriodState extends State<NextPeriod> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(241, 234, 137, 137),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 34),
              child: Text(
                "Current Hour",
                style: AppThemes().PeriodLabelStyle,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 80,
                  child: Center(
                    child: Text(
                      widget.current,
                      style: AppThemes().PeiodStyle,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(224, 229, 211, 14),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      Text(
                        "Next Hour",
                        style: AppThemes().PeriodLabelStyle,
                      ),
                      Container(
                        height: 137,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Center(
                          child: Text(
                            widget.next,
                            style: AppThemes().PeiodStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
