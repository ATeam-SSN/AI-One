import 'package:flutter/material.dart';

class attendence_screen extends StatefulWidget {
  const attendence_screen({super.key});

  @override
  State<attendence_screen> createState() => _attendence_screenState();
}

class _attendence_screenState extends State<attendence_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
    );
  }
}
