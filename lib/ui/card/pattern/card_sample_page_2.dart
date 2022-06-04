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

    var _alignments = [
      Alignment(deviceHeight / 2 + 40, left - 70),
      Alignment(deviceHeight / 2 + 20, left - 60),
      Alignment(deviceHeight / 2, left - 50),
      Alignment(deviceHeight / 2 - 20, left - 40),
      Alignment(deviceHeight / 2 - 200, left),
      Alignment(deviceHeight / 2 - 20, left + 40),
      Alignment(deviceHeight / 2, left + 50),
      Alignment(deviceHeight / 2 + 20, left + 60),
      Alignment(deviceHeight / 2 + 40, left + 70),
      Alignment(deviceHeight / 2 + 60, left + 80),
    ];

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
      child: Stack(
        children: [
          Positioned(
            top: _alignments[0].x,
            left: _alignments[0].y,
            width: width,
            height: height,
            child: Transform.rotate(
              angle: -20 * pi / 180,
              child: _cards[0],
            ),
          ),
          Positioned(
            top: _alignments[1].x,
            left: _alignments[1].y,
            width: width,
            height: height,
            child: Transform.rotate(
              angle: -20 * pi / 180,
              child: _cards[1],
            ),
          ),
          Positioned(
            top: _alignments[2].x,
            left: _alignments[2].y,
            width: width,
            height: height,
            child: Transform.rotate(
              angle: -20 * pi / 180,
              child: _cards[2],
            ),
          ),
          Positioned(
            top: _alignments[3].x,
            left: _alignments[3].y,
            width: width,
            height: height,
            child: Transform.rotate(
              angle: -20 * pi / 180,
              child: _cards[3],
            ),
          ),
          Positioned(
            top: _alignments[4].x,
            left: _alignments[4].y,
            width: width,
            height: height,
            child: _cards[4],
          ),
          Positioned(
            top: _alignments[5].x,
            left: _alignments[5].y,
            width: width,
            height: height,
            child: Transform.rotate(
              angle: 20 * pi / 180,
              child: _cards[0],
            ),
          ),
          Positioned(
            top: _alignments[6].x,
            left: _alignments[6].y,
            width: width,
            height: height,
            child: Transform.rotate(
              angle: 20 * pi / 180,
              child: _cards[1],
            ),
          ),
          Positioned(
            top: _alignments[7].x,
            left: _alignments[7].y,
            width: width,
            height: height,
            child: Transform.rotate(
              angle: 20 * pi / 180,
              child: _cards[2],
            ),
          ),
          Positioned(
            top: _alignments[8].x,
            left: _alignments[8].y,
            width: width,
            height: height,
            child: Transform.rotate(
              angle: 20 * pi / 180,
              child: _cards[3],
            ),
          ),
          Positioned(
            top: _alignments[9].x,
            left: _alignments[9].y,
            width: width,
            height: height,
            child: Transform.rotate(
              angle: 20 * pi / 180,
              child: _cards[4],
            ),
          ),
        ],
      ),
    );
  }
}
