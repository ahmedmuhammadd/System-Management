import 'package:flutter/material.dart';
import '../../../shared/constants.dart';

class PageHeaderWidget extends StatelessWidget {
  final double height;
  final double width;

  const PageHeaderWidget({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 3,
      width: width,
      decoration: const BoxDecoration(
        color: Constants.color,
        borderRadius:
            BorderRadiusDirectional.only(bottomEnd: Radius.circular(200)),
      ),
      child: Center(
        child: Icon(
          Icons.person_outline,
          size: width / 5,
          color: Colors.white,
        ),
      ),
    );
  }
}
