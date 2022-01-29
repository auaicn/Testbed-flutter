import 'package:flutter/material.dart';
import 'package:shop_ui/constants.dart';
import 'package:shop_ui/models/product.dart';
import 'package:shop_ui/screens/components/product_card.dart';
import 'package:shop_ui/screens/components/section_tile.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTile(
          title: 'New Arrival',
          press: () {},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              demoProduts.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: ProductCard(
                  image: demoProduts[index].image,
                  title: demoProduts[index].title,
                  price: demoProduts[index].price,
                  bgColor: demoProduts[index].bgColor,
                  onTap: () {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
