import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_widget.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';

const duration = Duration(milliseconds: 500);

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
  List<int> vector = []; // foward: 1, reverse: -1
  int correctionValue = 0; // 初回補正値
  late AnimationController controller =
      AnimationController(duration: duration, vsync: this);
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
        if (vector.every((element) => element == -1)) {
          debugPrint('reverse -> foward');
        }

        cards = List.generate(10, (i) => i)
            .map(
              (i) => AlignTransition(
                alignment: forwardAlignments[(index + i) % 10],
                child: Transform.rotate(
                  angle: _angle((index + i + 1) % 10),
                  child: CreditCard(
                    cardBackground: cardBackgrounds[i],
                  ),
                ),
              ),
            )
            .toList();
        ++index;

        cards.sort(
            (a, b) => (_x(a.alignment) - _x(b.alignment))); // 左のカードを前面に配置する

        vector.add(1);
      });
      controller.reset();
      controller.forward();
    }

    void _reverse() {
      setState(() {
        if (vector.every((element) => element == 1)) {
          correctionValue = vector.length;
          debugPrint('foward -> revese');
          debugPrint('correctionValue:' +
              correctionValue.toString()); // 初回 forward -> reverse のみ補正が必要
        }

        cards = List.generate(10, (i) => i)
            .map(
              (i) => AlignTransition(
                alignment:
                    reverseAlignments[(index + i - correctionValue) % 10],
                child: Transform.rotate(
                  angle: _angle((index + i - 1) % 10),
                  child: CreditCard(
                    cardBackground: cardBackgrounds[i],
                  ),
                ),
              ),
            )
            .toList();
        --index;

        cards.sort(
            (a, b) => (_x(a.alignment) - _x(b.alignment))); // 左のカードを前面に配置する

        vector.add(-1);
      });
      controller.reset();
      controller.forward();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          index.toString(),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            debugPrint('右スワイプ forward');
            _forward();
          }
          if (details.primaryVelocity! < 0) {
            debugPrint('左スワイプ reverse');
            _reverse();
          }
        },
        child: Stack(
          children: cards,
        ),
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
