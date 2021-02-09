import 'package:flutter/material.dart';

class NextNumberModel extends ChangeNotifier {
  int _nextNumber = 0;

  int get nextNumber => _nextNumber;
  set nextNumber(int val) {
    if (_nextNumber == val) return;
    _nextNumber = val;
    notifyListeners();
  }
}
