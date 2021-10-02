import 'package:analog_clock/components/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'country_card.dart';
import 'time_in_hour_and_minute.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'NewPort Beach, USA | PST',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TimeInHourAndMinute(),
          Spacer(),
          Clock(),
          Spacer(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CountryCard(
                  country: 'New York, USA',
                  iconSrc: 'assets/icons/Liberty.svg',
                  period: 'AM',
                  time: '9:20',
                  timeZone: '+3 HRS | EST',
                ),
                CountryCard(
                  country: 'Sydney, AU',
                  iconSrc: 'assets/icons/Sydney.svg',
                  period: 'AM',
                  time: '1:20',
                  timeZone: '+19 HRS | AEST',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
