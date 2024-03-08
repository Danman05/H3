// The BLoC logic reacting to events and emitting states
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/bloc/random_counter_event.dart';
import 'package:flutter_application_1/bloc/random_counter_state.dart';


class RandomCounterBloc extends Bloc<RandomCounterEvent, RandomCounterState> {
  RandomCounterBloc() : super(RandomCounterState().init()) {
    on<RandomCounterIncrement>(((event, emit) => emit(state.incrementRandom(state))));
    on<RandomCounterDecrement>((event, emit) => emit(state.decrementRandom(state)));
  }
}
