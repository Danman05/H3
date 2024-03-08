import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/bloc/counter_event.dart';
import 'package:flutter_application_1/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState().init()) {
    on<CounterIncrement>((event, emit) => emit(CounterState().increment()));
    on<CounterDecrement>((event, emit) => emit(CounterState().decrement()));
  }
}
