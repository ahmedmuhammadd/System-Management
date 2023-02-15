import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_mangment/shared/constants.dart';
import 'package:system_mangment/shared/shared_pref.dart';

import 'layout/layout_provider.dart';
import 'layout/layout_screen.dart';
import 'modules/auth/login/page/login_page.dart';
import 'modules/calendar/provider/calendar_provider.dart';
import 'modules/check/provider/check_page_provider.dart';
import 'modules/profile/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPref.init();
  Widget startWidget;
  dynamic uId = await SharedPref().getData(key: 'uId');
  if (uId == null) {
    startWidget = const LoginScreen();
  } else {
    startWidget = const LayoutScreen();
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CheckPageProvider()..getCheckTime(),
        ),
        ChangeNotifierProvider(
          create: (_) => LayoutProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CalendarProvider()..getCalenderDate(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditProfileProvider()..getProfilePic(),
        ),
      ],
      child: MyApp(startWidget: startWidget),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key key, @required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Constants.color, size: 20),
      ),
      routes: Constants.routes,
      home: startWidget,
    );
  }
}
