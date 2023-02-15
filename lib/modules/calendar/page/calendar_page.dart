import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:system_mangment/shared/constants.dart';

import '../../check/widgets/check_in_out_text.dart';
import '../../check/widgets/check_widget.dart';
import '../provider/calendar_provider.dart';
import '../widgets/filter_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  double height;
  double width;
  String id;

  @override
  void initState() {
    Constants().getMyUid().then((value) {
      id = value;
      log(id.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Attendance',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 23,
          ),
        ),
        const SizedBox(height: 10),
        FilterWidget(height: height, width: width),
        Consumer<CalendarProvider>(
          builder: (context, value, child) {
            if (value.listStatus == 'waiting') {
              return Expanded(
                child: Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballClipRotateMultiple,
                      color: Constants.color,
                    ),
                  ),
                ),
              );
            }
            if (value.listStatus == 'empty') {
              return Expanded(
                child: Center(
                  child: Text(
                    'You Have Not Check This Months',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 20, color: Constants.color),
                  ),
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: value.calenderList.length,
                  itemBuilder: (context, index) {
                    return CheckWidget(
                      date: value.calenderList[index]['date'].toString(),
                      // index: index,
                      checkIn: CheckInOutText(
                        textDescription: 'Check In',
                        timeText:
                            value.calenderList[index]['checkIn'].toString(),
                      ),
                      checkOut: CheckInOutText(
                        textDescription: 'Check Out',
                        timeText:
                            value.calenderList[index]['checkOut'].toString(),
                      ),
                      showContainerData: true,
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
