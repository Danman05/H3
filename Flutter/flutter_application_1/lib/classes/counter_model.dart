import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {

    int _count = 0;

    int get count => _count;

    // Count increment method
    void incrementCounter() {

      _count++;

      notifyListeners();
    }
    // Count decrement method
    void decrementCounter() {
      _count <= 0 ? _count = 0 : _count--;
    }

    // Modulus method
    bool isDivisibleByThree() => _count % 3 == 0;
}
