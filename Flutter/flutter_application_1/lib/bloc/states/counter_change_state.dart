class CounterChangeState {

  late int _currentNumber = 0;

  int get currentValue => _currentNumber;

  CounterChangeState init() {
    return CounterChangeState()
    .._currentNumber = 0;
  }

  CounterChangeState increment() {
    return CounterChangeState()
    .._currentNumber += 1;
  }

  CounterChangeState decrement() {
    return CounterChangeState()
    .._currentNumber = _currentNumber == 0 ? 0 : _currentNumber -= 1;
  }
}