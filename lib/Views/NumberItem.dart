import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:memorygame/Providers/BestScoreModel.dart';
import 'package:memorygame/Providers/GameStartModel.dart';
import 'package:memorygame/Providers/NextNumberModel.dart';
import 'package:memorygame/Providers/ScoreModel.dart';

class NumberItem extends StatefulWidget {
  final String val;
  final bool visible;
  final bool eliminated = false;
  NumberItem(this.val, {this.visible = true, Key key}) : super(key: key);

  @override
  _NumberItemState createState() => _NumberItemState();
}

class _NumberItemState extends State<NumberItem> {
  String val;
  bool visible;
  bool eliminated;
  @override
  void initState() {
    super.initState();
    val = widget.val;
    visible = widget.visible;
    eliminated = widget.eliminated;

    Future.delayed(Duration(seconds: 3), () {
      visible = false;
      setState(() {});
      Provider.of<NextNumberModel>(context, listen: false).nextNumber = 1;
      Provider.of<ScoreModel>(context, listen: false).startClock();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NextNumberModel>(
      builder: (context, value, child) => GestureDetector(
        child: child,
        onTap: () {
          itemClicked(value);
        },
      ),
      child: Container(
        child: Visibility(
          child: Text(
            val,
            style: const TextStyle(color: Colors.cyan, fontSize: 20),
          ),
          visible: visible,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
          color: eliminated ? Colors.black12 : Colors.white,
        ),
      ),
    );
  }

  void itemClicked(NextNumberModel value) {
    if (!eliminated) {
      if (value.nextNumber == int.parse(val)) {
        eliminated = true;
        visible = false;
        if (value.nextNumber == 25) {
          ScoreModel scoreModel =
              Provider.of<ScoreModel>(context, listen: false);
          scoreModel.stopClock();
          BestScoreModel bestScoreModel =
              Provider.of<BestScoreModel>(context, listen: false);
          if (bestScoreModel.initialized)
            bestScoreModel.bestScore =
                scoreModel.score < bestScoreModel.bestScore
                    ? scoreModel.score
                    : bestScoreModel.bestScore;
          else {
            bestScoreModel.bestScore = scoreModel.score;
            bestScoreModel.initialized = true;
          }
          Provider.of<GameStartModel>(context, listen: false).gameStarted =
              false;
          return;
        }
        value.nextNumber++;
      }
      setState(() {
        if (!visible && !eliminated) {
          visible = true;
          Future.delayed(Duration(seconds: 3), () {
            try {
              //future delay causes setstate after disposed NumberItem object so that causes Exception
              setState(() {
                visible = false;
              });
            } catch (e) {}
          });
        }
      });
    }
  }
}
