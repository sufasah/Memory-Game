import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memorygame/Providers/BestScoreModel.dart';
import 'package:memorygame/Providers/GameStartModel.dart';
import 'package:memorygame/Providers/NextNumberModel.dart';
import 'package:memorygame/Providers/ScoreModel.dart';

import 'Views/NumbersGrid.dart';
import 'Views/Statistics.dart';

void main() {
  runApp(MemoryGame());
}

class MemoryGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BestScoreModel()),
          ChangeNotifierProvider(create: (context) => NextNumberModel()),
          ChangeNotifierProvider(create: (context) => ScoreModel()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Statistics(),
          ),
          body: ChangeNotifierProvider(
            create: (context) => GameStartModel(),
            child: Center(
              child: Consumer<GameStartModel>(
                builder: (context, value, child) {
                  return value.gameStarted
                      ? child
                      : RaisedButton(
                          color: Colors.lightBlue[300],
                          padding: const EdgeInsets.all(30),
                          child: const Text("Start Game"),
                          onPressed: () {
                            value.gameStarted = true;
                          });
                },
                child: NumbersGrid(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
