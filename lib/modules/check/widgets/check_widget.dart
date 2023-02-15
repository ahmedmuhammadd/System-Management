import 'package:flutter/material.dart';

import '../../../shared/constants.dart';

class CheckWidget extends StatelessWidget {
  final Widget checkIn;
  final Widget checkOut;
  String date;
  final bool showContainerData;

  CheckWidget({
    Key key,
    @required this.checkIn,
    this.date,
    @required this.checkOut,
    @required this.showContainerData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(2, 2),
            color: Colors.black26,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          if (showContainerData)
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Constants.color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(date.split(' ')[0]),
                  Text(
                    date.split(' ')[1],
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: checkIn),
                Expanded(child: checkOut),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
