import 'package:flutter/material.dart';
import 'package:system_mangment/shared/constants.dart';

class CheckInOutText extends StatelessWidget {
  final String textDescription;
  final String timeText;

  const CheckInOutText({
    Key key,
    @required this.textDescription,
    @required this.timeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textDescription),
        Text(
          timeText,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(fontSize: 20, color: Constants.color),
        ),
      ],
    );
  }
}
