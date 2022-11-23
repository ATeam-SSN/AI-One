import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssn_qos/app_themes.dart';
import 'package:ssn_qos/models/student.dart';
import 'package:ssn_qos/screens/blank_template.dart';
import 'package:ssn_qos/widgets/custom_button.dart';

class UpdateAttendance extends StatefulWidget {
  const UpdateAttendance({super.key});

  @override
  State<UpdateAttendance> createState() => _UpdateAttendanceState();
}

List<Widget> UpdateList = [
  PendingUpdateTile(date: "23-11-2022", day: "Wednesday", turned: 1),
  PendingUpdateTile(date: "24-11-2022", day: "Thursday", turned: 0),
  PendingUpdateTile(date: "23-11-2022", day: "Wednesday", turned: 0)
];

class _UpdateAttendanceState extends State<UpdateAttendance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlankScreen(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            child: Center(
              child: Text(
                "Pending Updates",
                style: AppThemes().NotifyStyle,
              ),
            ),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: UpdateList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        height: 4,
                        thickness: 5,
                        indent: 10,
                        endIndent: 10,
                      ),
                  itemBuilder: (context, index) {
                    return UpdateList[index];
                  }),
            ),
          )
        ],
      )),
    );
  }
}

class PendingUpdateTile extends StatefulWidget {
  String date, day;
  int turned;
  PendingUpdateTile(
      {super.key, required this.date, required this.day, required this.turned});

  @override
  State<PendingUpdateTile> createState() => _PendingUpdateTileState();
}

class _PendingUpdateTileState extends State<PendingUpdateTile> {
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

    return Material(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DaysAttendance(date: widget.date, day: widget.day)));
        },
        child: Container(
          height: 60,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    widget.date,
                    style: widget.turned != 1
                        ? AppThemes().dayStyle
                        : AppThemes().dayStyleT,
                  ),
                  Text(
                    widget.day,
                    style: widget.turned != 1
                        ? AppThemes().dateStyle
                        : AppThemes().dateStyleT,
                  ),
                ],
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Day extends StatefulWidget {
  String subject, Stime, Etime, day, id;
  int total, attended;
  int turned = 0;
  Day({
    super.key,
    required this.subject,
    required this.Stime,
    required this.Etime,
    required this.day,
    required this.total,
    required this.attended,
    required this.id,
  });

  @override
  State<Day> createState() => _DayState();
}

class _DayState extends State<Day> {
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

    print(widget.day +
        widget.subject +
        widget.attended.toString() +
        widget.total.toString() +
        widget.id);
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      elevation: 4,
      child: Container(
        height: 60,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      widget.subject,
                      style: widget.turned != 1
                          ? AppThemes().dayStyle
                          : AppThemes().dayStyleT,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Start: " + widget.Stime + "    End:" + widget.Etime,
                      style: widget.turned != 1
                          ? AppThemes().dayStyle
                          : AppThemes().dayStyleT,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  if (isChecked == false) isChecked = value!;
                  Provider.of<Student>(context, listen: false).changeAttendance(
                      widget.day,
                      widget.subject,
                      widget.attended,
                      widget.total,
                      widget.id);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DaysAttendance extends StatefulWidget {
  String date, day;
  DaysAttendance({super.key, required this.date, required this.day});

  @override
  State<DaysAttendance> createState() => _DaysAttendanceState();
}

class _DaysAttendanceState extends State<DaysAttendance> {
  @override
  Widget build(BuildContext context) {
    var Subjects = [];
    Map<String, dynamic> AttdDetails =
        Provider.of<Student>(context, listen: false).attendance;
    print(AttdDetails);
    Map<String, dynamic> DaysTimeTable =
        Provider.of<Student>(context, listen: false).timetable[widget.day];
    for (var t in DaysTimeTable.keys) {
      Subjects.add(t);
    }
    Subjects.sort();
    Subjects = Subjects.toSet().toList();
    print(Subjects);
    return SafeArea(
        child: BlankScreen(
            child: Container(
      width: double.infinity,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(15)),
          Center(
            child: Text(
              "Fill up this form right now!!",
              style: AppThemes().NotifyStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Material(
                    color: Color.fromARGB(255, 240, 220, 163),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Text(
                        "Date: ",
                        style: AppThemes().dateStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.date,
                    style: AppThemes().dateStyle,
                  ),
                  Spacer(),
                  CustomButton(
                      icon: Icons.done,
                      color: Color.fromARGB(255, 97, 183, 237),
                      label: "Done",
                      onTap: () {
                        for (var i in DaysTimeTable.keys) {
                          Provider.of<Student>(context, listen: false)
                              .classHappened(
                                  widget.day,
                                  AttdDetails[DaysTimeTable[i]['id']]['total'],
                                  DaysTimeTable[i]['id']);
                        }
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            // flex: 1,
            child: Column(
              children: [
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Subjects.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          height: 4,
                          thickness: 5,
                          indent: 10,
                          endIndent: 10,
                        ),
                    itemBuilder: (context, index) {
                      print("ID:" +
                          DaysTimeTable[Subjects[index]]['id'].toString());
                      print("Name:" +
                          DaysTimeTable[Subjects[index]]['name'].toString());
                      return Padding(
                          padding: EdgeInsets.all(10),
                          child: Day(
                            day: widget.day,
                            subject: DaysTimeTable[Subjects[index]]['name'],
                            Stime: DaysTimeTable[Subjects[index]]['start'],
                            Etime: DaysTimeTable[Subjects[index]]['end'],
                            total: AttdDetails[DaysTimeTable[Subjects[index]]
                                ['id']]['total'],
                            attended: AttdDetails[DaysTimeTable[Subjects[index]]
                                ['id']]['attended'],
                            id: DaysTimeTable[Subjects[index]]['id'],
                          ));
                    }),
              ],
            ),
          )
        ],
      ),
    )));
  }
}
