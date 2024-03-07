import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/classes/counter_model.dart';
class StatefulScreen extends StatelessWidget {

  const StatefulScreen({super.key});
  
  void showSnackBar(context, consumer) 
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
        'Count ${consumer.count} is divisible by 3'),
        duration: const Duration(milliseconds: 300),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateful Test"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Consumer<CounterModel>(
          builder: (context, countModel, _) => Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${countModel.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: 'IncrementCountBtn', // Using herotags because we have multiple FAB's
                                                  // Each tag is unique
                    onPressed: () {
                      countModel.incrementCounter();

                      if (countModel.isDivisibleByThree()) {
                        showSnackBar(context, countModel);
                      }
                    },
                    tooltip: 'Increment',
                    backgroundColor: Colors.deepPurple.shade300,
                    child: const Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: "DecrementCountBtn",
                    onPressed: () {
                      countModel.decrementCounter();
                      if (countModel.isDivisibleByThree()) {
                        showSnackBar(context, countModel);
                      }
                    },
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
          ),
        ),
      ),
    );
  }  
}