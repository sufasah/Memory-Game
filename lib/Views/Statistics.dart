import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:memorygame/Providers/BestScoreModel.dart';
import 'package:memorygame/Providers/NextNumberModel.dart';
import 'package:memorygame/Providers/ScoreModel.dart';

class Statistics extends StatefulWidget {
  Statistics({Key key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<NextNumberModel>(
          builder: (context, value, child) => Text("Next: ${value.nextNumber}"),
        ),
        Consumer<ScoreModel>(
          builder: (context, value, child) {
            return Text("Score: ${value.score.toStringAsFixed(3)}");
          },
        ),
        Consumer<BestScoreModel>(
          builder: (context, value, child) =>
              Text("Best Score: ${value.bestScore.toStringAsFixed(3)}"),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
