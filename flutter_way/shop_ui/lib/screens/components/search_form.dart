import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ui/constants.dart';

// [Extract Widget] is very useful
class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: 20,
      leadingDistribution: TextLeadingDistribution.even,
    );

    return Form(
      child: TextFormField(
        style: textStyle,
        decoration: InputDecoration(
          hintText: 'Search Items.....',
          filled: true,
          fillColor: Colors.white,
          border: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          hintStyle: textStyle,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: SizedBox(
              height: 48,
              width: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,

                  /// [BorderRadius.all(Radius.circular)] 와 [BorderRadius.circular()] 가 같은 줄 알았는데
                  /// 전자에만 const 를 붙이는 것이 가능 하다.
                  /// BorderRdius.all 의 생성자는 const 생성장이다 하지만, BorderRadius.circular 는 const 생성자가 아니다.
                  /// 근데 더 까고보니, 결국 const 로 돌아오긴 한다. 그래서, 굳이 그럴필요를 못느꼇다.
                  shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.all(
                    //   Radius.circular(defaultBorderRadius),
                    // ),
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                ),
                child: SvgPicture.asset('assets/icons/Filter.svg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultBorderRadius),
  borderSide: BorderSide.none,
);
