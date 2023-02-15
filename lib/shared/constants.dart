import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:system_mangment/layout/layout_screen.dart';
import 'package:system_mangment/shared/shared_pref.dart';

import '../modules/auth/login/page/login_page.dart';
import '../modules/auth/register/page/register.dart';

class Constants {
  static const color = Color(0xffeef444c);
  static const double borderRadius = 15;

  static String liveDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

  static Map<String, Widget Function(BuildContext context)> routes = {
    'HomeScreen': (context) => const LayoutScreen(),
    'RegisterScreen': (context) => const RegisterScreen(),
    'LoginScreen': (context) => const LoginScreen(),
  };

  Future<String> getMyUid() async {
    return await SharedPref().getData(key: 'uId');
  }

  Future<String> getMyEmail() async {
    return await SharedPref().getData(key: 'email');
  }
}
