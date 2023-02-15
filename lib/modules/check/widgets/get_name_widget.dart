import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../shared/constants.dart';
import '../services/check_page_services.dart';

class GetNameWidget extends StatelessWidget {
  const GetNameWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Welcome ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 23,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: CheckPageServices().getUserData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    snapshot.data['userName'],
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 20, color: Constants.color),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballClipRotateMultiple,
                        color: Constants.color,
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
