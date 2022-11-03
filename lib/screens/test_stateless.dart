import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';

class figmaTest extends StatefulWidget {
  @override
  _figmaTestState createState() => _figmaTestState();
}

class _figmaTestState extends State<figmaTest> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Androidlarge1Widget - FRAME

    return Container(
        width: 360,
        height: 800,
        decoration: BoxDecoration(
          color: Color.fromRGBO(16, 38, 243, 0),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 346,
              left: 55,
              child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
          Positioned(
              top: 458,
              left: 55,
              child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
          Positioned(
              top: 412,
              left: 108,
              child: Text(
                'Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 30,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 305,
              left: 103,
              child: Text(
                'Username',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 30,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 167.1666717529297,
              left: 150,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        offset: Offset(0, 4),
                        blurRadius: 4)
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // SvgPicture.asset('assets/images/vector.svg',
                    //     semanticsLabel: 'vector'),
                    // SizedBox(height: 13),
                    // SvgPicture.asset('assets/images/vector.svg',
                    //     semanticsLabel: 'vector'),
                  ],
                ),
              )),
          Positioned(
              top: 244,
              left: 129,
              child: Text(
                'LOGIN',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 30,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 610,
              left: 38.85198974609375,
              child: Transform.rotate(
                angle: -1.6274068853811456 * (math.pi / 180),
                child: Text(
                  'New user?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 20,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              )),
          Positioned(
              top: 610,
              left: 208.85198974609375,
              child: Transform.rotate(
                angle: -1.6274068853811456 * (math.pi / 180),
                child: Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 20,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              )),
          Positioned(
              top: 29,
              left: 149,
              child: SvgPicture.asset('assets/images/vector.svg',
                  semanticsLabel: 'vector')),
          Positioned(
              top: 543,
              left: 129,
              child: Container(
                  width: 102,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
          Positioned(
              top: 541,
              left: 129,
              child: Text(
                'LOGIN',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 20,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 2,
              left: 0,
              child: Container(
                  width: 360,
                  height: 798,
                  decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     image: AssetImage(
                      //         'assets/images/150b7d49793a0f8b70acf68d11e182d61.png'),
                      //     fit: BoxFit.fitWidth),
                      ))),
        ]));
  }
}
