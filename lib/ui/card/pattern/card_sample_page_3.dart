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
  Alignment(-4.5, 0.5),
  Alignment(-4, 0.4),
  Alignment(-3.5, 0.3),
  Alignment(-3, 0.2),
  Alignment(0, -0.4),
  Alignment(4, 0.35),
  Alignment(4.5, 0.4),
  Alignment(5, 0.45),
  Alignment(5.5, 0.5),
  Alignment(6, 0.55),
];

double _angle(int index) {
  if (index < 4) {
    return -115 * pi / 180;
  } else if (index == 4) {
    return 90 * pi / 180;
  } else {
    return 120 * pi / 180;
  }
}

AnimatedContainer _card(int page, int i) => AnimatedContainer(
      duration: duration,
      alignment: _alignments[(page + i) % 10],
      child: Transform.rotate(
        angle: _angle((page + i) % 10),
        child: CreditCard(
          cardBackground: cardBackgrounds[i],
        ),
      ),
    );

class CardSamplePage3 extends StatefulWidget {
  const CardSamplePage3({Key? key}) : super(key: key);

  @override
  State<CardSamplePage3> createState() => _CardSampleState();
}

class _CardSampleState extends State<CardSamplePage3> {
  int page = 0;
  late List<AnimatedContainer> cards;

  @override
  initState() {
    super.initState();
    cards = List.generate(10, (i) => i)
        .map(
          (i) => _card(page, i),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    void _onTap() => setState(() {
          ++page;
          cards = List.generate(10, (i) => i)
              .map(
                (i) => _card(page, i),
              )
              .toList();
        });

    return Scaffold(
      body: Stack(
        children: cards,
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
