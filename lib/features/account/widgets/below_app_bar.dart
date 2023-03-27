import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user =Provider.of<UserProvider>(context).user;
    return Container(
      
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient2
      ),
      padding:const EdgeInsets.fromLTRB(25, 10, 10, 10),
      child: Row(
        children: [
          RichText(
            text:TextSpan(
              text: 'Hello, ',
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w300,
                color: Colors.black
              ),
              children: [
                TextSpan(
              text: user.name,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),
              ) 
              ]
            ) 
            ),
        ],
      ),
    );
  }
}