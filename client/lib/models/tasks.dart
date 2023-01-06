class Tasks {
  Tasks({
    required this.data,
    required this.message,
  });

  List<Datum> data;
  String message;

  factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.desc,
    required this.projectId,
    required this.userId,
    required this.issueDate,
    required this.issueTime,
    required this.dueTime,
    required this.isDone,
    required this.isNotify,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String desc;
  String projectId;
  String userId;
  DateTime issueDate;
  String issueTime;
  String dueTime;
  bool isDone;
  bool isNotify;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        desc: json["desc"],
        projectId: json["projectId"],
        userId: json["userId"],
        issueDate: DateTime.parse(json["issueDate"]),
        issueTime: json["issueTime"],
        dueTime: json["dueTime"],
        isDone: json["isDone"],
        isNotify: json["isNotify"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}
