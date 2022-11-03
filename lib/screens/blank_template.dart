import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'dart:math' as math;
// import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssn_qos/accentColors/main_screen_colors.dart';

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: top_bar_color,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: ButtonBar(
              mainAxisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceBetween,
              // buttonPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),

              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                      onPressed: null,
                      child: Image.asset(
                        'assets/images/menu_icon.png',
                      ),
                    )),
                Container(
                    height: 60,
                    width: 60,
                    child: FlatButton(
                        onPressed: null,
                        child:
                            SvgPicture.asset('assets/images/left_top_x.svg'))),
                Container(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        onPressed: null,
                        child: Image.asset('assets/images/avatar.png'))),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height - 20,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 248, 246),
                  borderRadius: BorderRadius.all(Radius.circular(43.0))),
            ),
          ),
        ]),
      ),
    );
  }
}
