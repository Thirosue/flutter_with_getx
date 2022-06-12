import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_widget.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';
import 'package:flutter_with_getx/data/model/response/c_card.dart';
import 'package:flutter_with_getx/data/repository/card_repository.dart';
import 'package:flutter_with_getx/helpers/wait.dart';
import 'package:get/get.dart';

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

class CardSampleController4 extends GetxController
    with GetSingleTickerProviderStateMixin {
  final CardRepository repository;
  CardSampleController4(this.repository);

  late AnimationController controller =
      AnimationController(duration: duration, vsync: this);
  late List<Animation<Alignment>> forwardAlignments;
  late List<Animation<Alignment>> reverseAlignments;

  final index = 0.obs;
  final cards = Rx<List<AlignTransition>>([]);

  @override
  void onInit() async {
    super.onInit();
    final response = await findAll();
    int size = response.length;
    debugPrint(response.toString());
    debugPrint(size.toString());

    forwardAlignments = List.generate(size, (i) => i)
        .map(
          (i) => controller
              .drive(
                CurveTween(curve: Curves.decelerate),
              )
              .drive(
                AlignmentTween(
                  begin: _alignments[(index.value + i) % 10],
                  end: _alignments[(index.value + i + 1) % 10],
                ),
              ),
        )
        .toList();

    reverseAlignments = List.generate(size, (i) => i)
        .map(
          (i) => controller
              .drive(
                CurveTween(curve: Curves.decelerate),
              )
              .drive(
                AlignmentTween(
                  begin: _alignments[(index.value + i) % 10],
                  end: _alignments[(index.value + i - 1) % 10],
                ),
              ),
        )
        .toList();

    cards.value = List.generate(size, (i) => i)
        .map(
          (i) => AlignTransition(
            alignment: forwardAlignments[(index.value + i) % 10],
            child: Transform.rotate(
              angle: _angle((index.value + i) % 10),
              child: CreditCard(
                cardBackground: cardBackgrounds[i],
              ),
            ),
          ),
        )
        .toList();

    debugPrint(cards.value.toString());
  }

  Future<List<CCard>> findAll() async {
    try {
      EasyLoading.show(status: 'loading...');
      await wait(seconds: 1);
      final results = await repository.findAll();
      final cards = CCard.toList(results.data!);
      debugPrint(cards.toString());
      return cards;
    } finally {
      EasyLoading.dismiss();
    }
  }

  void forward() {
    cards.value = List.generate(10, (i) => i)
        .map(
          (i) => AlignTransition(
            alignment: forwardAlignments[(index.value + i) % 10],
            child: Transform.rotate(
              angle: _angle((index.value + i + 1) % 10),
              child: CreditCard(
                cardBackground: cardBackgrounds[i],
              ),
            ),
          ),
        )
        .toList();
    ++index.value;

    cards.value
        .sort((a, b) => (_x(a.alignment) - _x(b.alignment))); // 左のカードを前面に配置する

    controller.reset();
    controller.forward();
  }

  void reverse() {
    cards.value = List.generate(10, (i) => i)
        .map(
          (i) => AlignTransition(
            alignment: reverseAlignments[(index.value + i) % 10],
            child: Transform.rotate(
              angle: _angle((index.value + i - 1) % 10),
              child: CreditCard(
                cardBackground: cardBackgrounds[i],
              ),
            ),
          ),
        )
        .toList();
    --index.value;

    cards.value
        .sort((a, b) => (_x(a.alignment) - _x(b.alignment))); // 左のカードを前面に配置する

    controller.reset();
    controller.forward();
  }
}
