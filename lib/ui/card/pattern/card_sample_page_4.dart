import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/repository/card_repository.dart';
import 'package:flutter_with_getx/ui/card/pattern/card_sample_controller_4.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class CardSamplePage4 extends StatelessWidget {
  CardSamplePage4({Key? key}) : super(key: key);
  final controller = Get.put(CardSampleController4(CardRepository()));

  @override
  Widget build(BuildContext context) {
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
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.remove),
            backgroundColor: Colors.red,
            onPressed: controller.reverse,
          ),
          Container(
            // 余白のためContainerでラップ
            margin: const EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              backgroundColor: Colors.blue,
              onPressed: controller.forward,
            ),
          ),
        ],
      ),
    );
  }
}
