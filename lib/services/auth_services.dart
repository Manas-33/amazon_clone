import 'dart:convert';

import 'package:amazon_clone/common/bottom_bar.dart';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/utils.dart';

class AuthService {
  //SIGN UP USER
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name
    }) async {
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
            showSnackBar(
                context, "Account Created! Login with the same credentials.");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //Sign IN
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  } 
  //for getting user data
  void getUserData(
    BuildContext context 
  )async{
    try {

      SharedPreferences prefs= await SharedPreferences.getInstance();
      //getting the token from shared preferences of 'x-auth-token' which we stored earlier
      String? token=prefs.getString('x-auth-token');
      //checking if the user already has logged in or not
      if(token==null){
        prefs.setString('x-auth-token', '');
      }
      //getting response from the api regarding the verification
      var tokenRes=await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String,String>{
          'Content-Type':'application/json; charset=UTF-8',
          'x-auth-token':token!
        }
        );
      
      var response=jsonDecode(tokenRes.body);

      if(response==true){
        //getting user data from the api
        http.Response userRes=await http.get(Uri.parse("$uri/"),
        headers: <String,String>{
          'Content-Type':'application/json; charset=UTF-8',
          'x-auth-token':token
        });

      var userProvider=Provider.of<UserProvider>(context,listen: false);
      //userRes is the variable which gets the http response of get
      userProvider.setUser(userRes.body);
      }
      
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
