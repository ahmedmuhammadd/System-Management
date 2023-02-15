import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:system_mangment/layout/layout_screen.dart';
import 'package:system_mangment/shared/shared_pref.dart';

import '../../../../shared/widgets/snack_bar_widget.dart';

class LoginServices {
  loginSubmit({
    @required String email,
    @required String password,
    BuildContext context,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((userData) {
      SharedPref.removeData(key: 'uId').then((value) {
        showSnackBar(context: context, msg: 'WAITING');
        SharedPref.saveData(key: 'uId', value: userData.user.uid.toString());
      }).then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, LayoutScreen.id, (route) => false);
      });
    }).catchError((e) {
      showSnackBar(context: context, msg: e.toString());
    });
  }
}
