import 'package:flutter/material.dart';
import 'package:memorygame/Views/NumberItem.dart';

class NumbersGrid extends StatefulWidget {
  NumbersGrid({Key key}) : super(key: key);

  @override
  _NumbersGridState createState() => _NumbersGridState();
}

class _NumbersGridState extends State<NumbersGrid> {
  List<NumberItem> numberItems;

  @override
  void initState() {
    super.initState();
    numberItems =
        List.generate(25, (i) => NumberItem((i + 1).toString())).toList();
    numberItems.shuffle();
  }

  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
      child: GridView.count(
        crossAxisCount: 5,
        children: numberItems,
      ),
    );
  }
}
