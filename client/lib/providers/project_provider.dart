import 'package:flutter/cupertino.dart';

class ProjectProvider extends ChangeNotifier {
  List<ProjectInfo> _projectsInfo = [];

  List<ProjectInfo> get projectsInfo => _projectsInfo;

  void setProjects(List infoList) {
    List<ProjectInfo> projectList = [];
    for (var i = 0; i < infoList.length; i++) {
      ProjectInfo info = ProjectInfo(
        id: infoList[i].id,
        name: infoList[i].name,
        desc: infoList[i].desc,
        userId: infoList[i].userId,
        icon: infoList[i].icon,
        color: infoList[i].color,
      );
      projectList.add(info);
    }
    _projectsInfo = projectList;
    notifyListeners();
  }
}

class ProjectInfo {
  ProjectInfo({
    required this.id,
    required this.name,
    required this.desc,
    required this.userId,
    required this.icon,
    required this.color,
  });

  String id;
  String name;
  String desc;
  String userId;
  String icon;
  String color;
}
