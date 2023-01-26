import 'package:amazon_clone/common/custom_button.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

import '../../common/custom_textfield.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                // tileColor: _auth==Auth.signup ? GlobalVariables.backgroundColor: GlobalVariables.greyBackgroundCOlor,
                title: const Text("Create Account",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(children: [
                        CustomTextField(
                            controller: _nameController, hintText: "Name"),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                            controller: _emailController, hintText: "Email"),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                            controller: _passwordController,
                            hintText: "Password"),
                        const SizedBox(
                          height: 18,
                        ),
                        CustomButton(text: "Sign Up", onTap: () {})
                      ]),
                    ),
                  ),
                ),
              ListTile(
                title: const Text("Sign-In",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: _signInFormKey,
                      child: Column(children: [
                        CustomTextField(
                            controller: _emailController, hintText: "Email"),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                            controller: _passwordController,
                            hintText: "Password"),
                        const SizedBox(
                          height: 18,
                        ),
                        CustomButton(text: "Sign In", onTap: () {})
                      ]),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
