// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStatelessTextField extends StatelessWidget {
  const CustomStatelessTextField({Key? key,
    required this.labelText,
    this.controller,
    this.inputType
  }) : super(key: key);
  final String labelText;
  final TextEditingController? controller;
  final TextInputType?inputType;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: inputType,
      cursorColor: Colors.black,
      controller: controller,
      style: const TextStyle(
          color: Colors.blue
      ),
      validator: (value) {
        if(value!.isEmpty){
          return "$labelText must not be empty";
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(
            color: Colors.deepOrange,
            fontSize: 16.sp
        ),
        hintStyle: TextStyle(
            color: Colors.grey
        ),
        label: Text(
          labelText,
          style:  TextStyle(
              color: Colors.black,
              fontSize: 19.sp
          ),
        ),
        border:  UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black54,
              width: 1.25.w
          ),
        ),
        enabledBorder:  UnderlineInputBorder(
          borderSide: BorderSide(
              color:Colors.black54,
              width: 1.25.w
          ),
        ),
        focusedBorder:  UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black54,
              width: 1.25.w
          ),
        ),
      ),
    );
  }
}
