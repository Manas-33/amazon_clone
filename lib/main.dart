
import 'package:amazon_clone/common/bottom_bar.dart';
import 'package:amazon_clone/features/auth/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:amazon_clone/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>UserProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService=AuthService();
  @override
  void initState() {
    super.initState();
    //calling the service from the main function in init state
    authService.getUserData(context);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Amazon Clone',
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            appBarTheme: const AppBarTheme(
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ))),
        onGenerateRoute: (settings) => generateRoute(settings),
        //checks whether the token is not empty 
        //if it is empty goes to auth screen
        //else goes to the home screen
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty? 
        const BottomBar():
        const AuthScreen());
  }
}
