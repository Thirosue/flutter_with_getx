import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_widget.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';
import 'package:flutter_with_getx/data/model/card/card_campany.dart';
import 'package:flutter_with_getx/data/model/card/card_network_type.dart';
import 'package:flutter_with_getx/data/model/response/c_card.dart';
import 'package:flutter_with_getx/data/repository/card_repository.dart';
import 'package:flutter_with_getx/helpers/wait.dart';
import 'package:flutter_with_getx/ui/card/detail/card_detail_page.dart';
import 'package:get/get.dart';

const duration = Duration(milliseconds: 500);

final cardBackgrounds = [
  SolidColorCardBackground(Colors.black),
  SolidColorCardBackground(Colors.blue),
  SolidColorCardBackground(Colors.yellow),
  SolidColorCardBackground(Colors.red),
  SolidColorCardBackground(Colors.purple),
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

// point
// 300-350 5.5, 8
// 350-400 4.5, 6
// 400-450 3.5, 4
// 450-500 2.5, 3
List<double> _cardPosition(double point) {
  if (point <= 350) {
    // iphne SE
    return [5.5, 8];
  } else if (point <= 400) {
    // iphne8, iphone 13 (mini)
    return [4.5, 6];
  } else if (point <= 450) {
    // iphne11, iphone 13 Pro Max
    return [3.5, 4];
  } else {
    return [2.5, 3];
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

CreditCard _creditCard(int i, CCard card) => CreditCard(
      cardBackground: cardBackgrounds[i % 5],
      cardNetworkType: CardNetworkType.of(card.type!),
      cardHolderName: card.name,
      cardNumber: card.cardNumber,
      company: CardCompany.of(card.campany!),
    );

AlignTransition _alignTransition({
  required int index,
  required int i,
  required List<Animation<Alignment>> alignments,
  required CCard card,
  required int correction,
}) =>
    AlignTransition(
      alignment: alignments[(index + i) % 10],
      child: Transform.rotate(
        angle: _angle((index + i + correction) % 10),
        child: _creditCard(i, card),
      ),
    );

List<GestureDetector> _cards({
  required int size,
  required int index,
  required List<Animation<Alignment>> alignments,
  required List<CCard> cards,
  required int correction,
}) =>
    List.generate(size, (i) => i)
        .map(
          (i) => GestureDetector(
            onTap: () {
              debugPrint('Clicked at index: $index');
              Get.to(
                () => const CardDetailPage(),
                arguments: cards[i],
                fullscreenDialog: true,
              );
            },
            child: _alignTransition(
              index: index,
              i: i,
              alignments: alignments,
              card: cards[i],
              correction: correction,
            ),
          ),
        )
        .toList();

class CardSampleController4 extends GetxController
    with GetSingleTickerProviderStateMixin {
  final BuildContext context;
  final CardRepository repository;
  CardSampleController4({
    required this.context,
    required this.repository,
  });

  late AnimationController controller =
      AnimationController(duration: duration, vsync: this);
  late List<Animation<Alignment>> forwardAlignments;
  late List<Animation<Alignment>> reverseAlignments;

  late List<CCard> cardList;
  late int size;
  final index = 0.obs;
  final cards = Rx<List<GestureDetector>>([]);

  @override
  void onInit() async {
    super.onInit();

    final deviceWidth = MediaQuery.of(context).size.width;
    debugPrint(deviceWidth.toString());
    const unit = 0.5;
    final left = _cardPosition(deviceWidth)[0];
    final right = _cardPosition(deviceWidth)[1];

    List<Alignment> alignments = [
      Alignment(-left, 0.5),
      Alignment(-left + unit, 0.4),
      Alignment(-left + unit * 2, 0.3),
      Alignment(-left + unit * 3, 0.2),
      const Alignment(0, -0.4),
      Alignment(right - unit * 4, 0.35),
      Alignment(right - unit * 3, 0.4),
      Alignment(right - unit * 2, 0.45),
      Alignment(right - unit, 0.5),
      Alignment(right, 0.55),
    ];

    cardList = await findAll();
    size = cardList.length;

    forwardAlignments = List.generate(size, (i) => i)
        .map(
          (i) => controller
              .drive(
                CurveTween(curve: Curves.decelerate),
              )
              .drive(
                AlignmentTween(
                  begin: alignments[(index.value + i) % 10],
                  end: alignments[(index.value + i + 1) % 10],
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
                  begin: alignments[(index.value + i) % 10],
                  end: alignments[(index.value + i - 1) % 10],
                ),
              ),
        )
        .toList();

    cards.value = _cards(
      size: size,
      index: index.value,
      alignments: forwardAlignments,
      cards: cardList,
      correction: 0,
    );

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
    cards.value = _cards(
      size: size,
      index: index.value,
      alignments: forwardAlignments,
      cards: cardList,
      correction: 1,
    );
    ++index.value;

    cards.value.sort((a, b) => (_x((a.child as AlignTransition).alignment) -
        _x((b.child as AlignTransition).alignment))); // 左のカードを前面に配置する

    controller.reset();
    controller.forward();
  }

  void reverse() {
    cards.value = _cards(
      size: size,
      index: index.value,
      alignments: reverseAlignments,
      cards: cardList,
      correction: -1,
    );
    --index.value;

    cards.value.sort((a, b) => (_x((a.child as AlignTransition).alignment) -
        _x((b.child as AlignTransition).alignment))); // 左のカードを前面に配置する

    controller.reset();
    controller.forward();
  }
}
