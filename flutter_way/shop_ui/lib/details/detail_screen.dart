import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ui/constants.dart';
import 'package:shop_ui/models/product.dart';

import 'components/color_button.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset('assets/icons/Heart.svg'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset(
              product.image,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: defaultPadding),
          Expanded(
            child: Container(
              /// child 에 symmetric, horizontal padding 을 주는 방법도 있지만, 위젯트리가 최대한
              /// 간단한 것이 조금 더 좋은 것 같다. Padding 만 전담하는 위젯이긴 하지만, 그것도 생각하지 않아도 되면
              /// 아랫단에서 편해질 수 있을 것 같다.
              padding: const EdgeInsets.only(
                top: defaultBorderRadius * 3,
                left: defaultBorderRadius,
                right: defaultBorderRadius,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Overflow 를 막기 위해 꼭 필요하다. Overflow 가 나는 경우, 왼쪽만 보이게 된다.
                      /// 우리가 원하는 동작은 ellipsis 되거나, UI 는 별로라도 multiline 으로 되어야 한다는 것인데,
                      /// Text 위젯은 width 가 정해져 있지 않으면 끝없이 그린다. 오른쪽 위젯이 아예 안보이게 될 수 있기 때문에
                      /// 최대한 길어질 가능성이 높은 애에 대해서 Expanded 를 해줘야 한다. Row Column 별로
                      /// 꼭 하나씩 넣어주는 습관이 중요할것 같다.
                      ///
                      /// 같은 이유로 SizedBox 도 넣어주는 것이, 아슬아슬 할 때 텍스트가 붙지 않게 할 수 있다.
                      Text(
                        product.title,
                        // 'product.title__product.title__product.title__product.title__',
                        style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        '\$${product.price}',
                        style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  /// It can be const
                  /// 그리고 multiline 이며 paragraph 의 특징을 가지고 있기 때문에, Padding 을 이부분에 넣어주면
                  /// 상당히 conventional 하다고 할 수 있다.
                  /// const 는 여기서 반복되는데 상단에만 적어주는걸로 보인다?
                  /// 왜냐면 그 밑으로 다시 빌드할 필요가 없음을 더 상단에서 잡아줄 수 있기 때문이다.?
                  const Padding(
                    /// not const?
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),

                    /// not const?
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Colors', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                      SizedBox(height: defaultPadding / 2),
                      Row(children: [
                        ColorButton(
                          bgColor: Colors.red.shade100,
                          selected: false,
                          press: () {},
                        ),
                        ColorButton(
                          bgColor: Colors.green.shade100,
                          selected: false,
                          press: () {},
                        ),
                        ColorButton(
                          bgColor: Colors.blue.shade100,
                          selected: true,
                          press: () {},
                        ),
                      ]),
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 1.5),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Add to cart'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
