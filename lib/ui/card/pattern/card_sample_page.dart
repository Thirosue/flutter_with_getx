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

class CardSamplePage extends StatelessWidget {
  const CardSamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _imageList = [
      Positioned(
        top: 10.0,
        left: 10.0,
        width: 200.0,
        height: 300.0,
        child: Transform.rotate(
          angle: -30 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[0],
          ),
        ),
      ),
      Positioned(
        top: 10.0,
        left: 10.0,
        width: 200.0,
        height: 300.0,
        child: Transform.rotate(
          angle: -20 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[1],
          ),
        ),
      ),
      Positioned(
        top: 10.0,
        left: 10.0,
        width: 200.0,
        height: 300.0,
        child: Transform.rotate(
          angle: -10 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[2],
          ),
        ),
      ),
      Positioned(
        top: 10.0,
        left: 10.0,
        width: 200.0,
        height: 300.0,
        child: Transform.rotate(
          angle: 0 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[3],
          ),
        ),
      ),
      Positioned(
        top: 10.0,
        left: 10.0,
        width: 200.0,
        height: 300.0,
        child: Transform.rotate(
          angle: 10 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[4],
          ),
        ),
      ),
      Positioned(
        top: 10.0,
        left: 10.0,
        width: 200.0,
        height: 300.0,
        child: Transform.rotate(
          angle: 20 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[5],
          ),
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Stack(
        children: [
          _imageList[0],
          _imageList[1],
          _imageList[2],
          _imageList[3],
          _imageList[4],
          _imageList[5],
        ],
      ),
    );
  }
}
