import 'package:flutter/material.dart';

import '../constants.dart';

class MainTextFormField extends StatelessWidget {
  double screenWidth;
  Color focusedBorderColor;
  Color suffixIconColor = Constants.color;
  String labelText;
  Function(String) validation;

  IconData icon;
  bool obscureText = false;
  TextEditingController controller;

  MainTextFormField({
    Key key,
    @required this.screenWidth,
    this.validation,
    @required this.focusedBorderColor,
    @required this.labelText,
    this.obscureText = false,
    @required this.icon,
    @required this.controller,
    this.suffixIconColor = Constants.color,
  }) : super(key: key);

  double verticalPadding = 50;

  double horizontalPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenWidth / verticalPadding,
        // horizontal: screenWidth / horizontalPadding,
      ),
      child: TextFormField(
        validator: (value) => validation(value),
        obscureText: obscureText,
        controller: controller,
        cursorColor: Colors.black,
        textAlign: TextAlign.start,
        style: const TextStyle(overflow: TextOverflow.fade),
        decoration: InputDecoration(
          label: Text(labelText, style: const TextStyle(color: Colors.black)),
          suffixIcon: Icon(icon, color: suffixIconColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
