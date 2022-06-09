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
    return -110 * pi / 180;
  } else if (index == 4) {
    return 90 * pi / 180;
  } else {
    return 110 * pi / 180;
  }
}

class CardSamplePage4 extends StatefulWidget {
  const CardSamplePage4({Key? key}) : super(key: key);

  @override
  State<CardSamplePage4> createState() => _CardSampleState();
}

class _CardSampleState extends State<CardSamplePage4>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _onTap() => setState(() => ++index);

    // final cardList = List.generate(10, (i) => i)
    //     .map(
    //       (i) => AnimatedContainer(
    //         duration: duration,
    //         alignment: _alignments[(index + i) % 10],
    //         child: Transform.rotate(
    //           angle: _angle((index + i) % 10),
    //           child: CreditCard(
    //             cardBackground: cardBackgrounds[i],
    //           ),
    //         ),
    //       ),
    //     )
    //     .toList();

    return Scaffold(
      body: SizedBox(
        height: animation.value,
        width: animation.value,
        child: CreditCard(
          cardBackground: cardBackgrounds[0],
        ),
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
