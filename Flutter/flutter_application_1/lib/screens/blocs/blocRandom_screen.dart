import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/bloc/random_counter_bloc.dart';
import 'package:flutter_application_1/bloc/random_counter_event.dart';
import 'package:flutter_application_1/bloc/random_counter_state.dart';
class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // CounterBloc bloc = BlocProvider.of<CounterBloc>(context);
    RandomCounterBloc bloc = BlocProvider.of<RandomCounterBloc>(context);
    bool isIncrementBtnEnabled;
    bool isDecrementBtnEnabled;

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')
      ),
      body: Center(
        child: BlocBuilder<RandomCounterBloc, RandomCounterState>(
          builder: (context, state) {
          
            // Ternary operators on state of current random number to disable buttons
            isIncrementBtnEnabled = state.currentRandomNumber >= 100 ? false : true;
            isDecrementBtnEnabled = state.currentRandomNumber <= 0 ? false : true;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Count: ${state.currentRandomNumber}',
                  style: const TextStyle(fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      // Using herotags because we have multiple FAB's
                      // Each tag is unique
                      heroTag: 'IncrementCountBtn', 
                      onPressed:  () => isIncrementBtnEnabled ? bloc.add(RandomCounterIncrement()) : null,
                      tooltip: 'Increment',
                      backgroundColor: Colors.deepPurple.shade300,
                      child: const Icon(
                        Icons.add,
                        color: Colors.green,
                      ),   
                    ),
                    FloatingActionButton(
                      heroTag: "DecrementCountBtn",
                      onPressed: () => isDecrementBtnEnabled ? bloc.add(RandomCounterDecrement()) : null,
                      tooltip: "Decrement",
                      backgroundColor: Colors.deepPurple.shade300,
                      child: const Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
