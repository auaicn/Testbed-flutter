import 'package:analog_clock/components/clock.dart';
import 'package:analog_clock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          CountryCard(
            country: 'New York, USA',
            iconSrc: 'assets/icons/Liberty.svg',
            period: 'AM',
            time: '9:20',
            timeZone: '+3 HRS | EST',
          )
        ],
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key key,
    @required this.country,
    @required this.timeZone,
    @required this.iconSrc,
    @required this.time,
    @required this.period,
  }) : super(key: key);

  final String country, timeZone, iconSrc, time, period;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(233),
      child: AspectRatio(
        aspectRatio: 1.32,
        child: Container(
          padding: EdgeInsets.all(
            getProportionateScreenWidth(20),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).primaryIconTheme.color),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$country',
                style: Theme.of(context).textTheme.headline4.copyWith(fontSize: getProportionateScreenWidth(16)),
              ),
              SizedBox(height: 6),
              Text('$timeZone'),
              Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    '$iconSrc',
                    width: getProportionateScreenWidth(40),
                  ),
                  Spacer(),
                  Text('$time', style: Theme.of(context).textTheme.headline4),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text('$period'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}