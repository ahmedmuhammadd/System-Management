import 'package:flutter/material.dart';

import '../constants.dart';

showSnackBar({
  @required BuildContext context,
  @required String msg,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Constants.color,
      content: Text(
        msg.toString(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
