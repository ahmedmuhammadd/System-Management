import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Row(
        children: [
          Text(
            DateFormat('dd ').format(DateTime.now()),
            style: const TextStyle(color: Colors.red),
          ),
          Text(
            DateFormat('MMM yyyy ').format(DateTime.now()),
          ),
        ],
      ),
    );
  }
}
