import 'package:flutter/material.dart';
import 'package:shop_ui/constants.dart';

class SectionTile extends StatelessWidget {
  final String title;
  final VoidCallback press;

  const SectionTile({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )),
          TextButton(
            onPressed: () {},
            child: Text(
              'See All',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.blueGrey),
            ),
          ),
        ],
      ),
    );
  }
}
