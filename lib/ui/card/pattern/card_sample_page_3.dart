import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_widget.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';

const duration = Duration(milliseconds: 250);

final cardBackgrounds = [
  SolidColorCardBackground(Colors.black.withOpacity(0.8)),
  SolidColorCardBackground(Colors.blue.withOpacity(0.8)),
  SolidColorCardBackground(Colors.yellow.withOpacity(0.8)),
  SolidColorCardBackground(Colors.red.withOpacity(0.8)),
  SolidColorCardBackground(Colors.purple.withOpacity(0.8)),
  SolidColorCardBackground(Colors.black.withOpacity(0.8)),
  SolidColorCardBackground(Colors.blue.withOpacity(0.8)),
  SolidColorCardBackground(Colors.yellow.withOpacity(0.8)),
  SolidColorCardBackground(Colors.red.withOpacity(0.8)),
  SolidColorCardBackground(Colors.purple.withOpacity(0.8)),
];

const _alignments = [
  Alignment(-2, 0.5),
  Alignment(-1.5, 0.45),
  Alignment(-1, 0.4),
  Alignment(-0.5, 0.35),
  Alignment(0, -0.4),
  Alignment(0.5, 0.35),
  Alignment(1, 0.4),
  Alignment(1.5, 0.45),
  Alignment(2, 0.5),
  Alignment(2.5, 0.55),
];

double _angle(int index) {
  if (index < 4) {
    return -110 * pi / 180;
  } else if (index == 4) {
    return 90 * pi / 180;
  } else {
    return 110 * pi / 180;
  }
}

class CardSamplePage3 extends StatefulWidget {
  const CardSamplePage3({Key? key}) : super(key: key);

  @override
  State<CardSamplePage3> createState() => _CardSampleState();
}

class _CardSampleState extends State<CardSamplePage3> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    void _onTap() => setState(() => ++index);

    final cardList = List.generate(10, (i) => i)
        .map(
          (i) => AnimatedContainer(
            duration: duration,
            alignment: _alignments[(index + i) % 10],
            child: Transform.rotate(
              angle: _angle((index + i) % 10),
              child: CreditCard(
                cardBackground: cardBackgrounds[i],
              ),
            ),
          ),
        )
        .toList();

    return Scaffold(
      body: Stack(
        children: cardList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTap,
      ),
    );
  }
}

class Card {
  int index;
  Widget widget;
  Card({required this.index, required this.widget});
}
