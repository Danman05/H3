
import 'dart:math';

class RandomCounterState  {
  // Maximum integer value for Random number
  final int maxValue = 100;
  late int _currentRandomNumber;

  int get currentRandomNumber => _currentRandomNumber;

  /// Get random number 0 - [max]
  int getRandom(int max) => Random().nextInt(max);

  // Init RandomCounterState
  RandomCounterState init() => RandomCounterState().._currentRandomNumber = 0;

  RandomCounterState incrementRandom(RandomCounterState currentState) {
    // This will generate numbers >= state.currentRandomNumber & < maxValue + currentRandomNumber
    int rand = getRandom(maxValue);
    // Update the count with the random number
    return RandomCounterState()
    .._currentRandomNumber = currentState._currentRandomNumber
    .._currentRandomNumber = rand + _currentRandomNumber > 100 ? 100 : rand + _currentRandomNumber; 
  }

  RandomCounterState decrementRandom(RandomCounterState currentState) {
    // This will generate numbers that are not higher than the current random number
    int rand = getRandom(currentState._currentRandomNumber+ 1);
    // Update the count with the random number
    return RandomCounterState()
        .._currentRandomNumber = currentState._currentRandomNumber
        .._currentRandomNumber = _currentRandomNumber - rand < 0 ? 0 : _currentRandomNumber - rand;

  }
}


