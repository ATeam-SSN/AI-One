import 'package:get/get.dart';
import 'package:ssn_qos/database_service/sql_service.dart';
import 'package:ssn_qos/models/task_model.dart';

class TaskController extends GetxController {
  var tasksList = <Task>[].obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  int Length({Task? task}) {
    return tasksList.length;
  }

  Future<int> addTask({Task? task}) async {
    return await SqlServices.insert(task);
  }

  Future<int> updateTask({Task? task}) async {
    return await SqlServices.updateTask(task);
  }

  Future getTask(int id) async {
    return SqlServices.getTask(id);
  }

  Future getTasks() async {
    List<Map<String, dynamic>> tasks = await SqlServices.query();
    return tasksList
        .assignAll(tasks.map((task) => Task.fromJson(task)).toList());
  }

  Future deleteTask(Task task) async {
    await SqlServices.deleteTask(task);
    getTasks();
  }

  Future updateTaskStatus(int id) async {
    await SqlServices.updateTaskStatus(id);
    getTasks();
  }
}
