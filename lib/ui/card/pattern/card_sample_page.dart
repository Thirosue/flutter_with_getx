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
    const width = 150.0;
    const height = 225.0;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    List _imageList = [
      Positioned(
        top: (deviceHeight / 2),
        left: deviceWidth / 20,
        width: width,
        height: height,
        child: Transform.rotate(
          angle: -30 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[0],
          ),
        ),
      ),
      Positioned(
        top: (deviceHeight / 2),
        left: deviceWidth / 20,
        width: width,
        height: height,
        child: Transform.rotate(
          angle: -20 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[1],
          ),
        ),
      ),
      Positioned(
        top: (deviceHeight / 2),
        left: deviceWidth / 20,
        width: width,
        height: height,
        child: Transform.rotate(
          angle: -10 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[2],
          ),
        ),
      ),
      Positioned(
        top: (deviceHeight / 2) - 150,
        left: (deviceWidth - width) / 2,
        width: width,
        height: height,
        child: Transform.rotate(
          angle: 0 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[3],
          ),
        ),
      ),
      Positioned(
        top: (deviceHeight / 2),
        left: deviceWidth / 2 + deviceWidth / 7,
        width: width,
        height: height,
        child: Transform.rotate(
          angle: 10 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[4],
          ),
        ),
      ),
      Positioned(
        top: deviceHeight / 2,
        left: deviceWidth / 2 + deviceWidth / 7,
        width: width,
        height: height,
        child: Transform.rotate(
          angle: 20 * pi / 180,
          child: CreditCard(
            cardBackground: cardBackgrounds[5],
          ),
        ),
      ),
    ];

    return Stack(
      children: [
        _imageList[0],
        _imageList[1],
        _imageList[2],
        _imageList[3],
        _imageList[4],
        _imageList[5],
      ],
    );
  }
}
