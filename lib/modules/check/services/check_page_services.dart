import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:system_mangment/shared/constants.dart';
import '../../../shared/widgets/snack_bar_widget.dart';
import '../../calendar/provider/calendar_provider.dart';
import '../provider/check_page_provider.dart';

class CheckPageServices {
  Future<void> checkInSubmit({
    @required BuildContext context,
  }) async {
    Constants().getMyUid().then((id) {
      FirebaseFirestore.instance
          .collection('user')
          .doc(id)
          .collection('record')
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get()
          .then((value) {
        if (!value.exists) {
          FirebaseFirestore.instance
              .collection('user')
              .doc(id)
              .collection('record')
              .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
              .set({
            'checkIn': DateFormat('hh:mm').format(DateTime.now()),
            'checkOut': '--/--',
            'date': DateFormat('dd MMMM').format(DateTime.now())
          }).then((value) {
            Provider.of<CheckPageProvider>(context, listen: false)
                .getCheckTime()
                .then((value) {
              Provider.of<CalendarProvider>(context, listen: false)
                  .getCalenderDate();
              showSnackBar(context: context, msg: 'Checked In Successfully!');
            });
          });
        } else {
          showSnackBar(context: context, msg: 'You Have Checked In Before');
        }
      });
    });
  }

  Future<void> checkOutSubmit({
    @required BuildContext context,
  }) async {
    Constants().getMyUid().then((id) {
      FirebaseFirestore.instance
          .collection('user')
          .doc(id)
          .collection('record')
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get()
          .then((value) {
        if (value.exists) {
          if (!value.data().containsKey('checkOut') ||
              value.data()['checkOut'] == '--/--') {
            FirebaseFirestore.instance
                .collection('user')
                .doc(id)
                .collection('record')
                .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
                .update({
              'checkOut': DateFormat('hh:mm').format(DateTime.now()),
            }).then((value) {
              Provider.of<CheckPageProvider>(context, listen: false)
                  .getCheckTime()
                  .then((value) {
                Provider.of<CalendarProvider>(context, listen: false)
                    .getCalenderDate();
                showSnackBar(context: context, msg: 'Checked Out Successfully');
              });
            });
          } else {
            showSnackBar(context: context, msg: 'You checked Out Today !');
          }
        } else {
          showSnackBar(context: context, msg: 'You Haven\'t Checked In!');
        }
      });
    });
  }

  Future getUserData() async {
    String id = await Constants().getMyUid();
    var firebaseData =
        await FirebaseFirestore.instance.collection('user').doc(id).get();
    return firebaseData;
  }
}
