class User {
  User({
    required this.data,
    required this.message,
  });

  Data data;
  String? message;

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String? id;
  String? name;
  String? email;
  String? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}
