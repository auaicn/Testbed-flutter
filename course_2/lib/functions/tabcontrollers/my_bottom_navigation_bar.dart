import 'package:flutter/material.dart';

const int HOME_PAGE_INDEX = 1;

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key key}) : super(key: key);
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final String _functionName = "Bottom Navigation Bar";

  int _selectedIndex = HOME_PAGE_INDEX;
  void _handleAppBarBackArrow() {
    Navigator.pop(context);
  }

  List views = [
    Container(color: Colors.white),
    Container(color: Colors.red),
    Container(color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_functionName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _handleAppBarBackArrow,
        ),
      ),
      body: views[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'tab 1',
            activeIcon: Icon(Icons.alarm_add_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web_asset_off),
            label: 'tab 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.online_prediction),
            label: 'tab 3',
          ),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        iconSize: 24,
      ),
    );
  }
}
