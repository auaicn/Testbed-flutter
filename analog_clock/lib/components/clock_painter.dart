import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // auxilary line
    // canvas.drawLine(Offset(0, 0), Offset(100, 0), Paint()..color = Colors.red); // check x-axis
    // canvas.drawLine(Offset(0, 0), Offset(0, 100), Paint()..color = Colors.blue); // check y-axis

    // Hour Calculation
    double hourX = centerX + size.width * 0.25 * cos(((dateTime.hour % 12) * 6) * pi / 180);
    double hourY = centerY + size.width * 0.25 * sin(((dateTime.hour % 12) * 6) * pi / 180);

    // Hour line
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = Theme.of(context).colorScheme.secondary
        ..strokeWidth = 10
        ..style = PaintingStyle.fill,
    );

    // Minute Calculation
    double minuteX = centerX + size.width * 0.3 * cos((dateTime.minute * 6) * pi / 180);
    double minuteY = centerY + size.width * 0.3 * sin((dateTime.minute * 6) * pi / 180);

    // Minute line
    canvas.drawLine(
      center,
      Offset(minuteX, minuteY),
      Paint()
        ..color = Theme.of(context).accentColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );

    // Second Calculation
    // size.width * 0.4 define our line length
    // dateTime.second * 6 means change speed of radius per second
    double secondX = centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY = centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    // Second line
    canvas.drawLine(center, Offset(secondX, secondY), Paint()..color = Theme.of(context).primaryColor);

    // center Dots
    Paint dotPainter = Paint()..color = Theme.of(context).primaryIconTheme.color;

    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(center, 23, Paint()..color = Theme.of(context).backgroundColor);

    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
