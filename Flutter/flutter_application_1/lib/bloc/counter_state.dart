
class CounterState {
  late int _currentNumber;

  int get currentNumber => _currentNumber;

  CounterState({int currentNumber = 0}) : _currentNumber = currentNumber;

  CounterState init() {
    return CounterState();
  }

  CounterState increment() {
    return CounterState()
    .._currentNumber+=1;
  } 

  CounterState decrement() {
    return CounterState()
        .._currentNumber = _currentNumber > 0 ? _currentNumber - 1 : 0;
  }
}
