
import 'package:amazon_clone/features/auth/auth_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>UserProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        home: const AuthScreen());
  }
}
