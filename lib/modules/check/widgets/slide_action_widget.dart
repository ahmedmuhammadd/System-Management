import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SliderActionWidget extends StatelessWidget {
  final GlobalKey slidKey;
  final Function onSubmit;
  final String text;
  double height = 60.0;
  double sliderButtonIconPadding = 10.0;
  double borderRadius = 25.0;
  double elevation = 20.0;
  int duration = 1;
  bool sliderRotate = false;
  final bool reversed;

  Color innerColor = Colors.red;
  Color textStyleColor = Colors.black;

  SliderActionWidget({
    Key key,
    this.duration,
    @required this.reversed,
    this.sliderButtonIconPadding,
    @required this.text,
    @required this.slidKey,
    @required this.onSubmit,
    this.height,
    this.borderRadius,
    this.elevation,
    this.innerColor,
    this.sliderRotate,
    this.textStyleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 25,
        ),
        child: SlideAction(
          reversed: reversed,
          key: slidKey,
          height: 60,
          animationDuration: const Duration(milliseconds: 1),
          sliderRotate: false,
          borderRadius: 25,
          text: text,
          sliderButtonIconPadding: 10,
          innerColor: Colors.red,
          textStyle: const TextStyle(color: Colors.black),
          outerColor: Colors.white,
          elevation: 20,
          onSubmit: onSubmit,
        ),
      );
    });
  }
}
