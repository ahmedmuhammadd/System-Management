import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_mangment/shared/constants.dart';

import '../provider/calendar_provider.dart';

class FilterWidget extends StatelessWidget {
  final double width;
  final double height;

  const FilterWidget({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarProvider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton(
              onChanged: (val) {
                value.onChange(val: val);
                value.getCalenderDate(context: context);
              },
              items: value.dropDownMenuItems,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              elevation: 100,
              value: value.month,
              borderRadius: BorderRadius.circular(20),
              menuMaxHeight: height / 3,
              dropdownColor: Colors.grey[200],
              autofocus: true,
            ),
            Row(
              children: [
                Text(
                  'Filter',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: width / 40, color: Constants.color),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(Icons.filter_list, size: width / 40)
              ],
            ),
          ],
        );
      },
    );
  }
}
