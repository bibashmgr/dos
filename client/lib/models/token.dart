class Token {
  Token({
    required this.data,
    required this.message,
  });

  String data;
  String message;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        data: json["data"],
        message: json["message"],
      );
}
