import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:system_mangment/shared/constants.dart';

import '../../../shared/widgets/snack_bar_widget.dart';

class CalendarProvider extends ChangeNotifier {
  String month = 'All';
  String listStatus = 'waiting';
  List<Map<String, dynamic>> calenderList = [];

  onChange({String val}) {
    listStatus = 'waiting';
    month = val;
    notifyListeners();
  }

  List<DropdownMenuItem> dropDownMenuItems = const [
    DropdownMenuItem(value: 'All', child: Text('All')),
    DropdownMenuItem(value: 'January', child: Text('January')),
    DropdownMenuItem(value: 'February', child: Text('February')),
    DropdownMenuItem(value: 'March', child: Text('March')),
    DropdownMenuItem(value: 'April', child: Text('April')),
    DropdownMenuItem(value: 'May', child: Text('May')),
    DropdownMenuItem(value: 'June', child: Text('June')),
    DropdownMenuItem(value: 'July', child: Text('July')),
    DropdownMenuItem(value: 'August', child: Text('August')),
    DropdownMenuItem(value: 'September', child: Text('September')),
    DropdownMenuItem(value: 'October', child: Text('October')),
    DropdownMenuItem(value: 'November', child: Text('November')),
    DropdownMenuItem(value: 'December', child: Text('December')),
  ];

  getCalenderDate({BuildContext context}) {
    calenderList.clear();
    Constants().getMyUid().then((id) {
      log(id);
      FirebaseFirestore.instance
          .collection('user')
          .doc(id)
          .collection('record')
          .get()
          .then((value) {
        for (var doc in value.docs) {
          if (month == 'All') {
            calenderList.add(doc.data());
          }
          if (doc.data()['date'].toString().contains(month)) {
            calenderList.add(doc.data());
          }
        }
        if (calenderList.isEmpty) {
          listStatus = 'empty';
          notifyListeners();
        }
        if (calenderList.isNotEmpty) {
          listStatus = 'not empty';
          notifyListeners();
        }
      }).catchError((e) {
        showSnackBar(context: context, msg: e.toString());
      });
    }).catchError((e) {
      showSnackBar(context: context, msg: e.toString());
    });
  }
}
