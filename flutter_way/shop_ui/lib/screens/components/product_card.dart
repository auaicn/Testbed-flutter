import 'package:flutter/material.dart';
import 'package:shop_ui/constants.dart';

class ProductCard extends StatelessWidget {
  final String image, title;
  final int price;
  final Color bgColor;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.onTap,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 154,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                  color: bgColor,
                ),
                child: Image.asset(
                  image,
                  height: 132,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  Expanded(
                    child: Text(title, style: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  Text('\$$price', style: Theme.of(context).textTheme.subtitle2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
