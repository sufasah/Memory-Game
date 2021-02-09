import 'package:flutter/material.dart';

class GameStartModel extends ChangeNotifier {
  bool _gameStarted = false;

  bool get gameStarted => _gameStarted;
  set gameStarted(bool val) {
    if (_gameStarted == val) return;
    _gameStarted = val;
    notifyListeners();
  }
}
