import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:system_mangment/layout/layout_provider.dart';
import 'package:system_mangment/layout/widgets/nav_bar_widget.dart';

import '../modules/check/provider/check_page_provider.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key key}) : super(key: key);
  static const String id = 'HomeScreen';

  @override
  State<LayoutScreen> createState() => _LayoutScreenScreenState();
}

class _LayoutScreenScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: AnimatedDefaultTextStyle(
                duration: const Duration(microseconds: 0),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width / 20),
                child: Consumer<LayoutProvider>(
                  builder: (context, value, child) {
                    return value.screen[value.index];
                  },
                )),
          ),
        ),
        bottomNavigationBar: Consumer<LayoutProvider>(
          builder: (context, value, child) {
            return BottomNavigationBarWidget(
              index: value.index,
              onTap: (index) {
                value.changeBottomNavigationBarItem(selectedIndex: index);
                if (index == 1) {
                  Provider.of<CheckPageProvider>(context, listen: false)
                      .getCheckTime();
                }
              },
              size0: value.index == 0 ? 35 : 22,
              size1: value.index == 1 ? 35 : 22,
              size2: value.index == 2 ? 35 : 22,
            );
          },
        ));
  }
}
