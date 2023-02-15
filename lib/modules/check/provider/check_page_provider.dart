import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../shared/constants.dart';

class CheckPageProvider extends ChangeNotifier {
  String checkIn = '--/--';
  String checkOut = '--/--';
  Future getCheckTime() async {
    Constants().getMyUid().then(
      (id) {
        FirebaseFirestore.instance
            .collection('user')
            .doc(id)
            .collection('record')
            .doc(Constants.liveDate)
            .get()
            .then(
          (value) {
            if (value.exists) {
              checkIn = value.data()['checkIn'] ?? '--/--';
              checkOut = value.data()['checkOut'] ?? '--/--';
              notifyListeners();
            } else {
              checkIn = '--/--';
              checkOut = '--/--';
              notifyListeners();
            }
          },
        ).catchError(
          (onError) {
            log(onError.toString());
          },
        );
      },
    );
  }
}
