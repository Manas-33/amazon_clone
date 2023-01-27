import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      type: '',
      address: '',
      token: '',
  );

  User get user=>_user;

  void setUser(String user){
    _user=User.fromJson(user);
    notifyListeners();
  }


}
