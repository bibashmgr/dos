import 'package:flutter/cupertino.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskInfo> _tasksInfo = [];

  List<TaskInfo> get tasksInfo => _tasksInfo;

  void setTasks(List infoList) {
    List<TaskInfo> taskList = [];
    for (var i = 0; i < infoList.length; i++) {
      TaskInfo info = TaskInfo(
        id: infoList[i].id,
        name: infoList[i].name,
        projectId: infoList[i].projectId,
        userId: infoList[i].userId,
        issueDate: infoList[i].issueDate,
        issueTime: infoList[i].issueTime,
        dueTime: infoList[i].dueTime,
        isDone: infoList[i].isDone,
        isNotify: infoList[i].isNotify,
      );
      taskList.add(info);
    }
    _tasksInfo = taskList;
    notifyListeners();
  }
}

class TaskInfo {
  TaskInfo({
    required this.id,
    required this.name,
    required this.projectId,
    required this.userId,
    required this.issueDate,
    required this.issueTime,
    required this.dueTime,
    required this.isDone,
    required this.isNotify,
  });

  String id;
  String name;
  String projectId;
  String userId;
  DateTime issueDate;
  String issueTime;
  String dueTime;
  bool isDone;
  bool isNotify;
}
