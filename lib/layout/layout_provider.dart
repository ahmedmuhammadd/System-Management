import 'package:flutter/material.dart';

import '../modules/calendar/page/calendar_page.dart';
import '../modules/check/page/check_page_screen.dart';
import '../modules/profile/page/profile_screen.dart';

class LayoutProvider extends ChangeNotifier {
  int index = 1;

  changeBottomNavigationBarItem({@required int selectedIndex}) {
    index = selectedIndex;
    notifyListeners();
  }

  List<Widget> screen = [
    const CalendarScreen(),
    const CheckPageScreen(),
    const EditProfileScreen(),
  ];
}
