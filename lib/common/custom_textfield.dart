import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField({super.key, required this.controller,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      validator: (val){
        if(val==null|| val.isEmpty){
          return 'Enter your $hintText';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText:hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariables.secondaryColor
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15))
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))
        )
      ),
    );
  }
}