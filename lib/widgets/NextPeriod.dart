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
      // padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 130, 237, 64),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Text(
            "Current Hour",
            style: AppThemes().PeriodLabelStyle,
          ),
          Text(
            widget.current,
            style: AppThemes().PeiodStyle,
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 24, 156, 189),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Text(
                    "Next Hour",
                    style: AppThemes().PeriodLabelStyle,
                  ),
                  Text(
                    widget.next,
                    style: AppThemes().PeiodStyle,
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
