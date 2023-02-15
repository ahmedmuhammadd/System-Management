import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int index;
  final double size0;

  final double size1;
  final double size2;
  final Function onTap;

  const BottomNavigationBarWidget({
    Key key,
    @required this.index,
    @required this.onTap,
    @required this.size0,
    @required this.size1,
    @required this.size2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      animationDuration: const Duration(seconds: 1),
      animationCurve: Curves.decelerate,
      height: 60,
      backgroundColor: Constants.color,
      index: index,
      onTap: (index) {
        onTap(index);
      },
      items: [
        Icon(
          index == 0 ? Icons.calendar_month : Icons.calendar_month_outlined,
          color: index != 0 ? Colors.black : Constants.color,
          size: size0,
        ),
        Icon(
          index == 1 ? Icons.check_circle : Icons.check_circle_outline,
          color: index != 1 ? Colors.black : Constants.color,
          size: size1,
        ),
        Icon(
          index == 2 ? Icons.person : Icons.person_outline,
          color: index != 2 ? Colors.black : Constants.color,
          size: size2,
        ),
      ],
    );
  }
}
