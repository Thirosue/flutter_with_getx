import 'package:flutter/material.dart';
import 'package:flutter_with_getx/ui/card/pattern/card_sample_controller_4.dart';
import 'package:get/get.dart';

class CardSamplePage4 extends StatelessWidget {
  CardSamplePage4({Key? key}) : super(key: key);

  final controller = Get.put(CardSampleController4());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: controller.cards.value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onTap,
      ),
    );
  }
}

class Card {
  int index;
  Widget widget;
  Card({required this.index, required this.widget});
}
