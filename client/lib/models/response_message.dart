class ResponseMessage {
  ResponseMessage({
    required this.data,
    required this.message,
  });

  dynamic data;
  String? message;

  factory ResponseMessage.fromJson(Map<String, dynamic> json) =>
      ResponseMessage(
        data: json["data"],
        message: json["message"],
      );
}
