import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../shared/constants.dart';

class MainIndicator extends StatelessWidget {
  const MainIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingIndicator(
        indicatorType: Indicator.ballClipRotateMultiple,
        color: Constants.color,
      ),
    );
  }
}
