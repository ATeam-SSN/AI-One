import 'package:flutter/material.dart';
import 'package:ssn_qos/accentColors/app_themes.dart';

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
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 144, 219, 97),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              "Current Hour",
              style: AppThemes().PeriodLabelStyle,
            ),
          ),
          Container(
            child: Center(
              child: Text(
                widget.current,
                style: AppThemes().PeiodStyle,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 169, 85),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Text(
                    "Next Hour",
                    style: AppThemes().PeriodLabelStyle,
                  ),
                  Container(
                    height: 127,
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
    );
  }
}
