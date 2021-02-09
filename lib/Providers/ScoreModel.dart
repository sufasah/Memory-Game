import 'dart:async';

import 'package:flutter/material.dart';

class ScoreModel extends ChangeNotifier {
  double _score = 0.0;
  double get score => _score;
  Timer _timer;
  set score(double val) {
    if (_score == val) return;
    _score = val;
    notifyListeners();
  }

  void startClock() {
    if (_timer == null) {
      score = 0;
      _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
        score += 0.001;
      });
    }
  }

  void stopClock() {
    _timer?.cancel();
    _timer = null;
  }
}
