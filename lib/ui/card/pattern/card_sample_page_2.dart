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
  List _cards = [
    CreditCard(
      cardBackground: cardBackgrounds[0],
    ),
    CreditCard(
      cardBackground: cardBackgrounds[1],
    ),
    CreditCard(
      cardBackground: cardBackgrounds[2],
    ),
    CreditCard(
      cardBackground: cardBackgrounds[3],
    ),
    CreditCard(
      cardBackground: cardBackgrounds[4],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const width = 200.0;
    const height = 250.0;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final left = deviceWidth / 2 - width / 2;

    return GestureDetector(
      onTap: () {
        setState(() {
          _cards = [
            CreditCard(
              cardBackground: cardBackgrounds[0],
            ),
            CreditCard(
              cardBackground: cardBackgrounds[1],
            ),
          ];
        });
      },
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          debugPrint('右スワイプ');
        }
        if (details.primaryVelocity! < 0) {
          debugPrint('左スワイプ');
        }
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: Stack(
          children: [
            Positioned(
              top: deviceHeight / 2 + 40,
              left: left - 70,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: -20 * pi / 180,
                child: _cards[0],
              ),
            ),
            Positioned(
              top: deviceHeight / 2 + 20,
              left: left - 60,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: -20 * pi / 180,
                child: _cards[1],
              ),
            ),
            Positioned(
              top: deviceHeight / 2,
              left: left - 50,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: -20 * pi / 180,
                child: _cards[2],
              ),
            ),
            Positioned(
              top: deviceHeight / 2 - 20,
              left: left - 40,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: -20 * pi / 180,
                child: _cards[3],
              ),
            ),
            Positioned(
              top: deviceHeight / 2 - 200,
              left: left,
              width: width,
              height: height,
              child: _cards[4],
            ),
            Positioned(
              top: deviceHeight / 2 - 20,
              left: left + 40,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: 20 * pi / 180,
                child: _cards[0],
              ),
            ),
            Positioned(
              top: deviceHeight / 2,
              left: left + 50,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: 20 * pi / 180,
                child: _cards[1],
              ),
            ),
            Positioned(
              top: deviceHeight / 2 + 20,
              left: left + 60,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: 20 * pi / 180,
                child: _cards[2],
              ),
            ),
            Positioned(
              top: deviceHeight / 2 + 40,
              left: left + 70,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: 20 * pi / 180,
                child: _cards[3],
              ),
            ),
            Positioned(
              top: deviceHeight / 2 + 60,
              left: left + 80,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: 20 * pi / 180,
                child: _cards[4],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
