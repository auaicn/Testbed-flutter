import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _counter = 0;

  // BehaviorSubject _counterSubject = BehaviorSubject<int>();
  BehaviorSubject _counterSubject = BehaviorSubject.seeded(0);

  BehaviorSubject get counter$ => _counterSubject;

  void increase() {
    _counter++;
    _counterSubject.add(_counter);
  }
}
