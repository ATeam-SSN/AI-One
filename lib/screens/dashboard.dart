import 'package:flutter/material.dart';

class dashboard_widget extends StatelessWidget {
  const dashboard_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xff1026f3),
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Positioned(
                              left: 14,
                              top: 479,
                              child: Container(
                                width: 160,
                                height: 299,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffd9d9d9),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 186,
                              top: 315,
                              child: Container(
                                width: 160,
                                height: 334,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffd9d9d9),
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          left: 14,
                          top: 202,
                          child: Container(
                            width: 160,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 186.33,
                          top: 23.76,
                          child: Container(
                            width: 160,
                            height: 275,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 14,
                          top: 25,
                          child: Container(
                            width: 160,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   left: 186,
                        //   top: 673,
                        //   child: Container(
                        //     width: 160,
                        //     height: 105,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(15),
                        //       color: Color(0xffd9d9d9),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 319,
              top: 19,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FlutterLogo(size: 30),
              ),
            ),
            Positioned(
              left: 165,
              top: 17,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 24.33,
              top: 27.33,
              child: Container(
                width: 23.33,
                height: 13.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FlutterLogo(size: 13.350001335144043),
              ),
            ),
            Positioned(
              left: 16,
              top: 14,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FlutterLogo(size: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
