import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as vcb;
class CustomButton extends StatelessWidget {
  final String text;
  final vcb.VoidCallback onTap;
  const CustomButton({super.key, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
      backgroundColor: GlobalVariables.secondaryColor,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // <-- Radius
    ),
    )
    );
  }
}