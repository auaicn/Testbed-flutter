import 'package:course_2/mixins/explicit_shout_mixin.dart';
import 'package:course_2/mixins/implicit_shout_mixin.dart';
import 'package:course_2/models/tab_item.dart';
import 'package:flutter/material.dart';

class MyTabController extends StatefulWidget {
  const MyTabController({Key key}) : super(key: key);

  @override
  _MyTabControllerState createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController>
    with TickerProviderStateMixin, ImplicitShoutMixin, ExplicitShoutMixin {
  final String _functionName = "Tab Controller";

  TabController _tabController;

  final List<TabItem> _tabItems = [
    TabItem(Icon(Icons.food_bank), "Food"),
    TabItem(Icon(Icons.weekend), "Weekly"),
    TabItem(Icon(Icons.shop), "shopping"),
    TabItem(Icon(Icons.bar_chart), "Stat"),
  ];

  void _handleAppBarBackArrow() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    super.shoutOut();
    _tabController = new TabController(vsync: this, length: _tabItems.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_functionName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _handleAppBarBackArrow,
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: List.generate(
            _tabController.length,
            (index) => Tab(
              icon: _tabItems[index].icon,
              text: _tabItems[index].text,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          _tabController.length,
          (index) => Center(
            child: Text("Tab ${index + 1}"),
          ),
        ),
      ),
    );
  }
}
