import 'package:flutter/material.dart';

class SwipeToDismiss extends StatefulWidget {
  const SwipeToDismiss({Key key}) : super(key: key);

  @override
  _SwipeToDismissState createState() => _SwipeToDismissState();
}

final items = List<String>.generate(20, (index) => "Item ${index + 1}");

class _SwipeToDismissState extends State<SwipeToDismiss> {
  final String _functionName = "swipe left to dismiss";

  void _handleAppBarBackArrow() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(_functionName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _handleAppBarBackArrow,
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: 40,
              width: _size.width,
              alignment: Alignment.centerLeft,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            // Show a red background as the item is swiped away.
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              // Then show a snackbar.
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item dismissed')));
            },
          );
        },
      ),
    );
  }
}
