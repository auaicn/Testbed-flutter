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
      body: Container(color: Colors.white),
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
              label: 'tab1',
              activeIcon: Icon(Icons.alarm_add_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'tab1'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'tab1'),
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
