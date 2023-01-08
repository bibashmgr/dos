class Projects {
  Projects({
    required this.data,
    required this.message,
  });

  List<Datum> data;
  String? message;

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.desc,
    required this.userId,
    required this.icon,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String? id;
  String? name;
  String? desc;
  String? userId;
  String? icon;
  String? color;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        desc: json["desc"],
        userId: json["userId"],
        icon: json["icon"],
        color: json["color"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}
