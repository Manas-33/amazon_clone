import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants/utils.dart';

class AuthService {
  //SIGN UP USER
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          type: '',
          address: '',
          token: '');
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      // print(res.body);
      httpErrorHandle(
        response: res, 
        context: context, 
        onSuccess: () {
          showSnackBar(context, "Account Created! Login with the same credentials.");
        });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
