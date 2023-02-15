import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:system_mangment/models/user.dart';
import '../../../../shared/shared_pref.dart';
import '../../../../shared/widgets/snack_bar_widget.dart';
import '../../login/services/login_services.dart';

class RegisterServices {
  registerSubmit({
    @required String email,
    @required String password,
    @required String address,
    @required String userName,
    @required BuildContext context,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((data) {
      UserModel model = UserModel(
        address: address,
        password: password,
        email: email,
        uID: data.user.uid,
        username: userName,
        profilePic: '',
      );
      FirebaseFirestore.instance
          .collection('user')
          .doc(data.user.uid)
          .set(model.toJson())
          .then((val) {
        SharedPref.saveData(key: 'uId', value: data.user.uid).then((e) {
          LoginServices()
              .loginSubmit(email: email, password: password, context: context);
        }).catchError((e) {
          showSnackBar(context: context, msg: e.toString());
        });
      }).catchError((e) {
        showSnackBar(context: context, msg: e.toString());
      });
    }).catchError((e) {
      showSnackBar(context: context, msg: e.toString());
    });
  }
}
