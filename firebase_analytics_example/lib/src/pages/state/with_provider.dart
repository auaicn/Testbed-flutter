import 'package:firebase_analytics_example/src/controller/count_controller_with_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('build whole');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('provider X 의 상태를 보여준다'),
          Consumer<CountControllerWithProvider>(builder: (context, snapshot, child) {
            print('build only');

            return Text('${snapshot.count}');
          }),
          TextButton(
            onPressed: () {
              Provider.of<CountControllerWithProvider>(context, listen: false).increase();
            },
            child: Text('+'),
          ),
        ],
      ),
    );
  }
}
