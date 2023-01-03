import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  UserInfo _userInfo = UserInfo(
    id: '',
    name: '',
    email: '',
    avatar: '',
  );

  UserInfo get userInfo => _userInfo;

  void setUser(info) {
    _userInfo = UserInfo(
      id: info.id,
      name: info.name,
      email: info.email,
      avatar: info.avatar,
    );
    notifyListeners();
  }
}

class UserInfo {
  String id;
  String name;
  String email;
  String avatar;

  UserInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });
}
