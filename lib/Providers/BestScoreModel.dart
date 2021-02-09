import 'package:flutter/material.dart';

class BestScoreModel extends ChangeNotifier {
  double _bestScore = 0;
  bool initialized = false;

  double get bestScore => _bestScore;
  set bestScore(double val) {
    if (_bestScore == val) return;
    _bestScore = val;
    notifyListeners();
  }
}
