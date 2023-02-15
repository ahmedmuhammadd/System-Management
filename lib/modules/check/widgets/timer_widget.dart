import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          return Text(
            DateFormat('hh:mm:ss a').format(DateTime.now()),
            style: Theme.of(context).textTheme.caption.copyWith(
                fontSize: MediaQuery.of(context).size.width / 20),
          );
        });
  }
}
