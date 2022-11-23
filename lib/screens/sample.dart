import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ssn_qos/app_themes.dart';
import 'package:ssn_qos/controllers/task_controller.dart';
import 'package:ssn_qos/models/task_model.dart';
import 'package:ssn_qos/screens/add_tasks.dart';
import 'package:ssn_qos/screens/blank_template.dart';
import 'package:ssn_qos/screens/displaytask.dart';
import 'package:ssn_qos/services/dark_theme_service.dart';
import 'package:ssn_qos/services/notification_helper.dart';
import 'package:ssn_qos/widgets/custom_button.dart';
import 'package:ssn_qos/widgets/task.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final TaskController _taskController = Get.put(TaskController());
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  DateTime _selectedDate = DateTime.now();
  var notifyHelper;
  @override
  void initState() {
    notifyHelper = NotificationHelper();
    notifyHelper.initNotification();
    notifyHelper.requestIOSPermission();
    _taskController.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenH = MediaQuery.of(context).size.height;
    final double screenW = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, _taskController);
        return Future.value(false);
      },
      child: SafeArea(
        child: BlankScreen(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenH / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(
                        DateTime.now(),
                      ),
                      style: AppThemes().subtitleStyle,
                    ),
                    CustomButton(
                      icon: Icons.add_task,
                      color: Colors.green,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddTask()));
                      },
                      label: 'Add Task',
                    )
                  ],
                ),
                Text(
                  'Today',
                  style: AppThemes().titleStyle,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: DatePicker(
                    DateTime.now(),
                    height: screenH * 0.127,
                    width: screenW * 0.18,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.green,
                    selectedTextColor: Colors.white,
                    dayTextStyle: AppThemes().dayStyle,
                    monthTextStyle: AppThemes().monthStyle,
                    dateTextStyle: AppThemes().dateStyle,
                    onDateChange: (date) {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                  ),
                ),
                _showTasks()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(
        () {
          return StaggeredGridView.countBuilder(
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: _taskController.tasksList.length,
              itemBuilder: (context, index) {
                Task task = _taskController.tasksList[index];
                print(task.title);
                DateTime time =
                    DateFormat.jm().parse(task.startTime.toString());
                var myTime = DateFormat("HH:mm").format(time);
                if (task.repeat == 'Day') {
                  if (task.remind == 5) {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 5,
                      task: task,
                    );
                  } else if (task.remind == 10) {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 10,
                      task: task,
                    );
                  } else if (task.remind == 15) {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 15,
                      task: task,
                    );
                  } else {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 20,
                      task: task,
                    );
                  }
                  return _showAnimationConfig(
                      id: int.parse(task.id.toString()),
                      index: index,
                      onLongPressed: () {
                        _showBottomSheets(
                            _taskController.tasksList[index], context);
                      });
                } else if (task.date ==
                    DateFormat.yMd().format(_selectedDate)) {
                  if (task.remind == 5) {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 5,
                      task: task,
                    );
                  } else if (task.remind == 10) {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 10,
                      task: task,
                    );
                  } else if (task.remind == 15) {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 15,
                      task: task,
                    );
                  } else {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 20,
                      task: task,
                    );
                  }
                  return _showAnimationConfig(
                      id: int.parse(task.id.toString()),
                      index: index,
                      onLongPressed: () {
                        _showBottomSheets(
                            _taskController.tasksList[index], context);
                      });
                } else if (task.repeat == 'Never' &&
                    task.date == DateFormat.yMd().format(_selectedDate)) {
                  if (task.remind == 5) {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 5,
                      task: task,
                    );
                  } else if (task.remind == 10) {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 10,
                      task: task,
                    );
                  } else if (task.remind == 15) {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 15,
                      task: task,
                    );
                  } else {
                    notifyHelper.scheduledNotification(
                      hour: int.parse(myTime.toString().split(":")[0]),
                      minute: int.parse(myTime.toString().split(":")[1]) - 20,
                      task: task,
                    );
                  }
                  return _showAnimationConfig(
                      id: int.parse(task.id.toString()),
                      index: index,
                      onLongPressed: () {
                        _showBottomSheets(
                            _taskController.tasksList[index], context);
                      });
                }
                // else if (task.repeat == 'Week') {
                //     if (task.remind == 5) {
                //       notifyHelper.scheduledNotification(
                //         hour: int.parse(myTime.toString().split(":")[0]),
                //         minute: int.parse(myTime.toString().split(":")[1]) - 5,
                //         task: task,
                //       );
                //     }
                //     else if (task.remind == 10) {
                //       notifyHelper.scheduledNotification(
                //         hour: int.parse(myTime.toString().split(":")[0]),
                //         minute: int.parse(myTime.toString().split(":")[1]) - 10,
                //         task: task,
                //       );
                //     }
                //     else if (task.remind == 15) {
                //       notifyHelper.scheduledNotification(
                //         hour: int.parse(myTime.toString().split(":")[0]),
                //         minute: int.parse(myTime.toString().split(":")[1]) - 15,
                //         task: task,
                //       );
                //     }
                //     else {
                //       notifyHelper.scheduledNotification(
                //         hour: int.parse(myTime.toString().split(":")[0]),
                //         minute: int.parse(myTime.toString().split(":")[1]) - 20,
                //         task: task,
                //       );
                //     }
                //     return _showAnimationConfig(
                //         id: int.parse(task.id.toString()),
                //         index: index,
                //         onLongPressed: () {
                //           _showBottomSheets(
                //               _taskController.tasksList[index], context);
                //         });
                //
                //
                // }
                // else if (task.repeat == 'Month') {
                //   if (task.remind == 5) {
                //     notifyHelper.scheduledNotification(
                //       hour: int.parse(myTime.toString().split(":")[0]),
                //       minute: int.parse(myTime.toString().split(":")[1]) - 5,
                //       task: task,
                //     );
                //   }
                //   else if (task.remind == 10) {
                //     notifyHelper.scheduledNotification(
                //       hour: int.parse(myTime.toString().split(":")[0]),
                //       minute: int.parse(myTime.toString().split(":")[1]) - 10,
                //       task: task,
                //     );
                //   }
                //   else if (task.remind == 15) {
                //     notifyHelper.scheduledNotification(
                //       hour: int.parse(myTime.toString().split(":")[0]),
                //       minute: int.parse(myTime.toString().split(":")[1]) - 15,
                //       task: task,
                //     );
                //   }
                //   else {
                //     notifyHelper.scheduledNotification(
                //       hour: int.parse(myTime.toString().split(":")[0]),
                //       minute: int.parse(myTime.toString().split(":")[1]) - 20,
                //       task: task,
                //     );
                //   }
                //   return _showAnimationConfig(
                //       id: int.parse(task.id.toString()),
                //       index: index,
                //       onLongPressed: () {
                //         _showBottomSheets(
                //             _taskController.tasksList[index], context);
                //       });
                //
                //
                // }
                else {
                  return Container();
                }
              });
        },
      ),
    );
  }

  _showBottomSheets(Task task, BuildContext context) async {
    Get.bottomSheet(Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: Get.isDarkMode ? Color(0xff1f1f21) : Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(3.0),
            width: MediaQuery.of(context).size.width * 0.4,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(50.0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              task.isCompleted == 1
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10.0),
                      child: CustomButton(
                          height: 50,
                          width: 150,
                          color: Colors.green,
                          label: 'Completed',
                          onTap: () {
                            _taskController.updateTaskStatus(task.id!);
                            Get.back();
                          }),
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                child: CustomButton(
                    height: 50,
                    width: 150,
                    color: Colors.red,
                    label: 'Delete',
                    onTap: () {
                      _taskController.deleteTask(task);
                      Get.back();
                    }),
              )
            ],
          )
        ],
      ),
    ));
  }

  _showAnimationConfig(
      {required int id, required int index, required Function onLongPressed}) {
    return AnimationConfiguration.staggeredList(
        position: index,
        child: SlideAnimation(
          child: FadeInAnimation(
            child: GestureDetector(
              onLongPress: () {
                onLongPressed();
              },
              onTap: () {
                Get.to(() => DisplayTask(
                      id: id,
                    ));
              },
              child: CardWidget(
                task: _taskController.tasksList[index],
                index: index,
              ),
            ),
          ),
        ));
  }
}
