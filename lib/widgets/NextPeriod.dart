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
            color: Color.fromARGB(255, 144, 219, 97),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
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
              height: 16,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 226, 169, 85),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    Text(
                      "Next Hour",
                      style: AppThemes().PeriodLabelStyle,
                    ),
                    Container(
                      height: 137,
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
          ],
        ),
      ),
    );
  }
}
