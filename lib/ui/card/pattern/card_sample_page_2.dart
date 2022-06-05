import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_widget.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';

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

class CardSamplePage2 extends StatefulWidget {
  const CardSamplePage2({Key? key}) : super(key: key);

  @override
  State<CardSamplePage2> createState() => _CardSampleState();
}

class _CardSampleState extends State<CardSamplePage2> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 250);
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

    void _onTap() => setState(() => ++index);

    double _angle(int index) {
      if (index < 4) {
        return -110 * pi / 180;
      } else if (index == 4) {
        return 90 * pi / 180;
      } else {
        return 110 * pi / 180;
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          for (var i = 0; i <= 9; i++)
            AnimatedContainer(
              duration: duration,
              alignment: _alignments[(index + i) % 10],
              child: Transform.rotate(
                angle: _angle((index + i) % 10),
                child: CreditCard(
                  cardBackground: cardBackgrounds[i],
                ),
              ),
            ),
        ],
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
