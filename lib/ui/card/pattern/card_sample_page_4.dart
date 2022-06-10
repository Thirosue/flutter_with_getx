import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_widget.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';

const duration = Duration(milliseconds: 250);

final cardBackgrounds = [
  SolidColorCardBackground(Colors.black),
  SolidColorCardBackground(Colors.blue),
  SolidColorCardBackground(Colors.yellow),
  SolidColorCardBackground(Colors.red),
  SolidColorCardBackground(Colors.purple),
  SolidColorCardBackground(Colors.black),
  SolidColorCardBackground(Colors.blue),
  SolidColorCardBackground(Colors.yellow),
  SolidColorCardBackground(Colors.red),
  SolidColorCardBackground(Colors.purple),
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
  int index = 0;
  late AnimationController controller = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this);
  late List<Animation<Alignment>> alignments = List.generate(10, (i) => i)
      .map(
        (i) => controller
            .drive(
              CurveTween(curve: Curves.decelerate),
            )
            .drive(
              AlignmentTween(
                begin: _alignments[(index + i) % 10],
                end: _alignments[(index + i + 1) % 10],
              ),
            ),
      )
      .toList();
  late List<AlignTransition> cards = List.generate(10, (i) => i)
      .map(
        (i) => AlignTransition(
          alignment: alignments[(index + i) % 10],
          child: Transform.rotate(
            angle: _angle((index + i) % 10),
            child: CreditCard(
              cardBackground: cardBackgrounds[i],
            ),
          ),
        ),
      )
      .toList();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _onTap() {
      controller.reset();
      controller.forward();
      setState(() {
        ++index;
        cards = List.generate(10, (i) => i)
            .map(
              (i) => AlignTransition(
                alignment: alignments[(index + i) % 10],
                child: Transform.rotate(
                  angle: _angle((index + i + 1) % 10),
                  child: CreditCard(
                    cardBackground: cardBackgrounds[i],
                  ),
                ),
              ),
            )
            .toList();
        debugPrint("before--------");
        cards.forEach((element) {
          debugPrint(
              (element.alignment as Animation<Alignment>).value.x.toString());
          debugPrint(
              (((element.alignment as Animation<Alignment>).value.x + 10) * 10)
                  .ceil()
                  .toString());
        });
        cards.sort((a, b) =>
            ((((a.alignment as Animation<Alignment>).value.x + 10) * 10)
                    .ceil() -
                (((b.alignment as Animation<Alignment>).value.x + 10) * 10)
                    .ceil()));
        debugPrint("after--------");
        cards.forEach((element) {
          debugPrint(
              (element.alignment as Animation<Alignment>).value.x.toString());
          debugPrint(
              (((element.alignment as Animation<Alignment>).value.x + 10) * 10)
                  .ceil()
                  .toString());
        });
      });
    }

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
