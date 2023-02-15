import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CalenderServices {
  static Stream<QuerySnapshot> getDocSnapShot({@required String id}) {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection('record')
        .snapshots();
  }
}
