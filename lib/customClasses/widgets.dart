import 'package:flutter/material.dart';
import 'package:fridge/customClasses/textstyles.dart';

class DataInput extends StatelessWidget {
  const DataInput(
      {super.key,
      required this.controller,
      required this.textStyle,
      required this.hintText});
  final TextEditingController controller;
  final TextStyle textStyle;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        style: FridgeTextStyles.hintstyle,
        controller: controller,
        textAlignVertical: TextAlignVertical.bottom,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          hintStyle: textStyle,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: Colors.blue)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: Colors.blue)),
        ),
      ),
    );
  }
}
