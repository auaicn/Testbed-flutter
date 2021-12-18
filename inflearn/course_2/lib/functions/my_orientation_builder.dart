import 'package:flutter/material.dart';

class MyOrientationBuilder extends StatefulWidget {
  const MyOrientationBuilder({Key key}) : super(key: key);

  @override
  _MyOrientationBuilderState createState() => _MyOrientationBuilderState();
}

class _MyOrientationBuilderState extends State<MyOrientationBuilder> {
  final int _crossAxisCountInPortraitMode = 3;
  final int _crossAxisCountInLandscapeMode = 5;
  final String _functionName = "Orientation Builder";
  void _handleAppBarBackArrow() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_functionName),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _handleAppBarBackArrow,
        ),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return GridView.count(
            // 기본적으로 그리드 뷰의 밑에 패딩이 있는것을 확인하였다.
            padding: EdgeInsets.zero,

            // GridView 는 기본적으로 ratio 1:1 을 가져가는 것 같다.
            crossAxisCount: orientation == Orientation.portrait
                ? _crossAxisCountInPortraitMode
                : _crossAxisCountInLandscapeMode,
            children: List.generate(
              50,
              (index) => Center(
                child: Text('Item $index'),
              ),
            ),
          );
        },
      ),
    );
  }
}
