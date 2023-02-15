import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../../calendar/provider/calendar_provider.dart';
import '../provider/check_page_provider.dart';
import '../services/check_page_services.dart';
import '../widgets/check_in_out_text.dart';
import '../widgets/check_widget.dart';
import '../widgets/date_widget.dart';
import '../widgets/get_name_widget.dart';
import '../widgets/slide_action_widget.dart';
import '../widgets/timer_widget.dart';

class CheckPageScreen extends StatefulWidget {
  const CheckPageScreen({Key key}) : super(key: key);

  @override
  State<CheckPageScreen> createState() => _CheckPageScreenScreenState();
}

class _CheckPageScreenScreenState extends State<CheckPageScreen> {
  var sliderInKey = GlobalKey<SlideActionState>();
  var sliderOutKey = GlobalKey<SlideActionState>();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const GetNameWidget(),
        CheckWidget(
          showContainerData: false,
          checkIn: Consumer<CheckPageProvider>(
            builder: (context, value, child) => CheckInOutText(
              textDescription: 'Check In',
              timeText: value.checkIn,
            ),
          ),
          checkOut: Consumer<CheckPageProvider>(
            builder: (context, value, child) => CheckInOutText(
              textDescription: 'Check Out',
              timeText: value.checkOut,
            ),
          ),
        ),
        const DateWidget(),
        const TimerWidget(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SliderActionWidget(
                reversed: false,
                slidKey: sliderInKey,
                onSubmit: () {
                  CheckPageServices().checkInSubmit(context: context);
                  Provider.of<CalendarProvider>(context, listen: false)
                      .getCalenderDate(context: context);
                },
                text: 'Slide here to check In',
              ),
              const SizedBox(height: 10),
              SliderActionWidget(
                reversed: true,
                slidKey: sliderOutKey,
                onSubmit: () {
                  CheckPageServices().checkOutSubmit(context: context);
                  Provider.of<CalendarProvider>(context, listen: false)
                      .getCalenderDate(context: context);
                },
                text: 'Slide here to check Out',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
