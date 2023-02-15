import 'package:flutter/material.dart';

class PageNameWidget extends StatelessWidget {
  final double height;
  final double width;
  final String pageText;

  const PageNameWidget({
    Key key,
    @required this.width,
    @required this.height,
    @required this.pageText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsetsDirectional.only(
          top: height / 30,
          bottom: height / 30,
        ),
        child: Center(
            child: Text(
          pageText,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )));
  }
}
