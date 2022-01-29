import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ui/constants.dart';

import 'components/categories.dart';
import 'components/new_arrival.dart';
import 'components/popular.dart';
import 'components/search_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        /// [backgroundColor] 가 [Colors.transparent] 일때, elevation 이 있으면 UI 가 이상하다.
        /// elevation 에 의해 그림자가 생기게 되어 0 으로 설정한다
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/menu.svg'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/Location.svg'),
            const SizedBox(width: defaultPadding / 2),
            Text('15/2 New Texas', style: Theme.of(context).textTheme.subtitle2),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/Notification.svg')),
        ],
      ),

      /// [SingleChildScrollView] 의 프로퍼티 중에, padding 이 있었구나.
      /// 아무튼 SingleChildScrollView 가 패딩 안에 있는 그림만 아니면 될 것 같다.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore',
              style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w500, color: Colors.blueGrey),
            ),
            const Text(
              'best Outfits for you',
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            const Categories(),

            /// onPressed 등 VoidCallback 같은게 있는 경우, const 를 적용할 수 없다.
            /// 대단한건, 대부분을 const 화 할 수 있었다는 점인 것 같다.
            /// 물론, const 로 생성한 위젯이 내부적으로 const 가 아닌 위젯을 포함할 수는 있다.
            const NewArrival(),
            const SizedBox(height: defaultPadding),
            const Popular(),
          ],
        ),
      ),
    );
  }
}
