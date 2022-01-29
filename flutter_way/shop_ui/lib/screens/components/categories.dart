import 'package:flutter/material.dart';
import 'package:shop_ui/constants.dart';
import 'package:shop_ui/models/category.dart';
import 'package:shop_ui/screens/components/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          demoCategories.length,
          (index) {
            Category category = demoCategories[index];

            return Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: CategoryCard(
                icon: category.icon,
                press: () {},
                title: category.title,
              ),
            );
          },
        ),
      ),
    );
  }
}
