import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/repository/card_repository.dart';
import 'package:flutter_with_getx/ui/card/pattern/card_sample_controller_4.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class CardSamplePage4 extends StatelessWidget {
  const CardSamplePage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CardSampleController4(
      repository: CardRepository(),
      context: context,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.index.toString(),
          ),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            debugPrint('右スワイプ forward');
            controller.forward();
          }
          if (details.primaryVelocity! < 0) {
            debugPrint('左スワイプ reverse');
            controller.reverse();
          }
        },
        child: Obx(
          () => Stack(
            children: controller.cards.value,
          ),
        ),
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "hero1",
            backgroundColor: Colors.red,
            onPressed: controller.reverse,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: "hero2",
            backgroundColor: Colors.blue,
            onPressed: controller.forward,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
