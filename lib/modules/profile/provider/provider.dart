import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:system_mangment/shared/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../shared/widgets/snack_bar_widget.dart';
import '../../../models/user.dart';

class EditProfileProvider extends ChangeNotifier {
  String networkProfilePic;
  File profileImage;
  bool existPic = false;

  Future pickProfileImage() async {
    ImagePicker().getImage(source: ImageSource.gallery).then(
      (value) {
        if (value != null) {
          profileImage = File(value.path);
          networkProfilePic == '';
          existPic = true;
          notifyListeners();
        } else {
          log('pick image now ');
          notifyListeners();
        }
      },
    );
  }

  getProfilePic() {
    Constants().getMyUid().then((id) {
      FirebaseFirestore.instance.collection('user').doc(id).get().then((value) {
        networkProfilePic = value.data()['profilePic'];
        if (value.data()['profilePic'] == '') {
          existPic = true;
        }
        notifyListeners();
      });
    });
  }

  Future uploadProfilePicToStorage({
    @required String userName,
    @required String email,
    @required String password,
    @required String address,
    @required BuildContext context,
  }) async {
    Constants().getMyUid().then((id) {
      if (profileImage == null) {
        updateUser(
          email: email,
          address: address,
          password: password,
          userName: userName,
          profilePic: '',
          id: id,
        );
      } else {
        firebase_storage.FirebaseStorage.instance
            .ref()
            .child('user/$id${Uri.file(profileImage.path)}')
            .putFile(profileImage)
            .then((value) {
          value.ref.getDownloadURL().then((picUrl) {
            updateUser(
              email: email,
              address: address,
              password: password,
              userName: userName,
              profilePic: picUrl,
              id: id,
            );
          }).catchError((e) {
            showSnackBar(context: context, msg: e.toString());
          });
        }).catchError((onError) {
          showSnackBar(context: context, msg: onError.toString());
        });
      }
    });
  }

  removePickedPic() {
    profileImage = File('');
    existPic = false;
    notifyListeners();
  }

  updateUser({
    String email,
    String password,
    String address,
    String userName,
    String profilePic,
    String id,
    BuildContext context,
  }) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .get()
        .then((userData) {
      log(userData.data()['userName']);
      // log(userData['email']);
      // log(userData['password']);
      // log(userData['password']);
      UserModel userModel = UserModel(
        password: password == '' ? userData.data()['password'] : password,
        address: address == '' ? userData.data()['address'] : address,
        email: email == '' ? userData.data()['email'] : email,
        username: userName == '' ? userData.data()['userName'] : userName,
        profilePic:
            profilePic == '' ? userData.data()['profilePic'] : profilePic,
      );

      FirebaseFirestore.instance
          .collection('user')
          .doc(id)
          .update(
            userModel.toJson(),
          )
          .then((value) {
        showSnackBar(context: context, msg: "Updated Successfully");
      }).catchError((e) {
        showSnackBar(context: context, msg: e.toString());
      });
    });
  }
}
