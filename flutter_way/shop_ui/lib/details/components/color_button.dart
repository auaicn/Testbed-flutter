import 'package:flutter/material.dart';
import 'package:shop_ui/constants.dart';

class ColorButton extends StatelessWidget {
  final Color bgColor;
  final bool selected;
  final VoidCallback press;

  const ColorButton({
    Key? key,
    required this.bgColor,
    required this.selected,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding / 4),
        // circle avatar 에 radius 주는 방법도 있다.
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: selected ? primaryColor : Colors.transparent),
        ),
        child: CircleAvatar(
          radius: 10,
          backgroundColor: bgColor,
        ),
      ),
    );
  }
}
