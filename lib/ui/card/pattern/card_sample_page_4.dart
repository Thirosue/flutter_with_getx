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

int _x(Animation<AlignmentGeometry> value) {
  return ((double.parse(value
              .toStringDetails()
              .split(' → ')[1]
              .replaceFirst('Alignment(', '')
              .replaceAll(')', '')
              .split(',')[0])) *
          10)
      .ceil();
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
  late List<Animation<Alignment>> forwardAlignments =
      List.generate(10, (i) => i)
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
  late List<Animation<Alignment>> reverseAlignments =
      List.generate(10, (i) => i)
          .map(
            (i) => controller
                .drive(
                  CurveTween(curve: Curves.decelerate),
                )
                .drive(
                  AlignmentTween(
                    begin: _alignments[(index + i) % 10],
                    end: _alignments[(index + i - 1) % 10],
                  ),
                ),
          )
          .toList();
  late List<AlignTransition> cards = List.generate(10, (i) => i)
      .map(
        (i) => AlignTransition(
          alignment: forwardAlignments[(index + i) % 10],
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
    void _forward() {
      setState(() {
        cards = List.generate(10, (i) => i)
            .map(
              (i) => AlignTransition(
                alignment: forwardAlignments[(index + i) % 10],
                child: Transform.rotate(
                  angle: _angle((index + i + 1) % 10),
                  child: CreditCard(
                    cardBackground: cardBackgrounds[i],
                    cardNumber: index.toString(),
                  ),
                ),
              ),
            )
            .toList();
        ++index;

        debugPrint("forward before--------");
        for (var element in cards) {
          debugPrint((element.alignment).toStringDetails());
        }
        cards.sort((a, b) => (_x(a.alignment) - _x(b.alignment)));
        debugPrint("forward after--------");
        for (var element in cards) {
          debugPrint((element.alignment).toStringDetails());
        }
      });
      controller.reset();
      controller.forward();
    }

    void _reverse() {
      setState(() {
        cards = List.generate(10, (i) => i)
            .map(
              (i) => AlignTransition(
                alignment: reverseAlignments[(index + i) % 10],
                child: Transform.rotate(
                  angle: _angle((index + i - 1) % 10),
                  child: CreditCard(
                    cardBackground: cardBackgrounds[i],
                    cardNumber: index.toString(),
                  ),
                ),
              ),
            )
            .toList();
        --index;

        debugPrint("reverse before--------");
        for (var element in cards) {
          debugPrint((element.alignment).toStringDetails());
        }
        cards.sort((a, b) => (_x(a.alignment) - _x(b.alignment)));
        debugPrint("reverse after--------");
        for (var element in cards) {
          debugPrint((element.alignment).toStringDetails());
        }
      });
      controller.reset();
      controller.forward();
    }

    return Scaffold(
      body: Stack(
        children: cards,
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.remove),
            backgroundColor: Colors.red,
            onPressed: _reverse,
          ),
          Container(
            // 余白のためContainerでラップ
            margin: const EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              backgroundColor: Colors.blue,
              onPressed: _forward,
            ),
          ),
        ],
      ),
    );
  }
}

class Card {
  int index;
  Widget widget;
  Card({required this.index, required this.widget});
}
