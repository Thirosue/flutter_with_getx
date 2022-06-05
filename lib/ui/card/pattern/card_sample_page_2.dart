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
  SolidColorCardBackground(Colors.orange.withOpacity(0.8)),
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
      Alignment(-1.5, 0.4),
      Alignment(-1, 0.3),
      Alignment(-0.5, 0.2),
      Alignment(0, -0.5),
      Alignment(0.5, 0.2),
      Alignment(1, 0.3),
      Alignment(1.5, 0.4),
      Alignment(2, 0.5),
      Alignment(2.5, 0.6),
    ];

    void _onTap() => setState(() => ++index);

    double _angle(int index) {
      if (index % 10 < 4) {
        return -110 * pi / 180;
      } else if (index % 10 == 4) {
        return 90 * pi / 180;
      } else {
        return 110 * pi / 180;
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: duration,
            alignment: _alignments[index % 10],
            child: Transform.rotate(
              angle: _angle(index),
              child: CreditCard(
                cardBackground: cardBackgrounds[0],
                cardNumber: (index % 10).toString(),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            alignment: _alignments[(index + 1) % 10],
            child: Transform.rotate(
              angle: _angle(index + 1),
              child: CreditCard(
                cardBackground: cardBackgrounds[1],
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            alignment: _alignments[(index + 2) % 10],
            child: Transform.rotate(
              angle: _angle(index + 2),
              child: CreditCard(
                cardBackground: cardBackgrounds[2],
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            alignment: _alignments[(index + 3) % 10],
            child: Transform.rotate(
              angle: _angle(index + 3),
              child: CreditCard(
                cardBackground: cardBackgrounds[3],
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            alignment: _alignments[(index + 4) % 10],
            child: Transform.rotate(
              angle: _angle(index + 4),
              child: CreditCard(
                cardBackground: cardBackgrounds[4],
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            alignment: _alignments[(index + 5) % 10],
            child: Transform.rotate(
              angle: _angle(index + 5),
              child: CreditCard(
                cardBackground: cardBackgrounds[0],
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            alignment: _alignments[(index + 6) % 10],
            child: Transform.rotate(
              angle: _angle(index + 6),
              child: CreditCard(
                cardBackground: cardBackgrounds[1],
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            alignment: _alignments[(index + 7) % 10],
            child: Transform.rotate(
              angle: _angle(index + 7),
              child: CreditCard(
                cardBackground: cardBackgrounds[2],
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            alignment: _alignments[(index + 8) % 10],
            child: Transform.rotate(
              angle: _angle(index + 8),
              child: CreditCard(
                cardBackground: cardBackgrounds[3],
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            alignment: _alignments[(index + 9) % 10],
            child: Transform.rotate(
              angle: _angle(index + 9),
              child: CreditCard(
                cardBackground: cardBackgrounds[4],
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
