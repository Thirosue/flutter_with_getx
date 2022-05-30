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

class CardSamplePage extends StatefulWidget {
  const CardSamplePage({Key? key}) : super(key: key);

  @override
  State<CardSamplePage> createState() => _CardSampleState();
}

class _CardSampleState extends State<CardSamplePage> {
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
    const width = 150.0;
    const height = 225.0;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    List _rotate(List items) {
      List tmpList = [];
      tmpList.add(items[4]);
      tmpList.add(items[0]);
      tmpList.add(items[1]);
      tmpList.add(items[2]);
      tmpList.add(items[3]);
      return tmpList;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          final shuffled = _rotate(_cards);
          _cards = shuffled;
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
        duration: const Duration(seconds: 2),
        child: Stack(
          children: [
            Positioned(
              top: (deviceHeight / 2),
              left: deviceWidth / 20,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: -20 * pi / 180,
                child: _cards[0],
              ),
            ),
            Positioned(
              top: (deviceHeight / 2),
              left: deviceWidth / 20,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: -10 * pi / 180,
                child: _cards[1],
              ),
            ),
            Positioned(
              top: (deviceHeight / 2) - 150,
              left: (deviceWidth - width) / 2,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: 0 * pi / 180,
                child: _cards[2],
              ),
            ),
            Positioned(
              top: (deviceHeight / 2),
              left: deviceWidth / 2 + deviceWidth / 7,
              width: width,
              height: height,
              child: Transform.rotate(
                angle: 10 * pi / 180,
                child: _cards[3],
              ),
            ),
            Positioned(
              top: deviceHeight / 2,
              left: deviceWidth / 2 + deviceWidth / 7,
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
