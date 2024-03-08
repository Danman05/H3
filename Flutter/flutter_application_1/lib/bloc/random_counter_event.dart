// Defines the events for BLoC
abstract class RandomCounterEvent {}

class RandomCounterIncrement extends RandomCounterEvent {}

class RandomCounterDecrement extends RandomCounterEvent {}
