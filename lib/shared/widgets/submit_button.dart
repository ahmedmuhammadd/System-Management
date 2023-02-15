import 'package:flutter/material.dart';

import '../constants.dart';

class MainSubmitButton extends StatelessWidget {
  final Color buttonColor;
  final double screenWidth;
  final double screenHeight;
  final String buttonText;
  final Function onTap;

  const MainSubmitButton({
    Key key,
    @required this.buttonColor,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.buttonText,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth / 40,
          // horizontal: screenWidth / 20,
        ),
        child: Container(
          width: double.infinity,
          height: screenHeight / 15,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(Constants.borderRadius),
            ),
          ),
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(
              fontSize: screenWidth / 26,
              color: Colors.white,
            ),
          )),
        ),
      ),
    );
  }
}
