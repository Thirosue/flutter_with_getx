import 'dart:math';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_with_getx/helpers/wait.dart';
import 'package:get/get.dart';

class IndexController extends GetxController with StateMixin<List<String>> {
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    EasyLoading.show(status: 'loading...');
    final random = Random().nextInt(10);
    await wait(seconds: 2);

    if (1 == random) {
      change(null, status: RxStatus.error('Something is wrong.'));
    } else if (random < 4) {
      change(null, status: RxStatus.empty());
    } else {
      final data = [
        for (var i = 0; i < 100; i++) 'ABCDEGHIJKLMN',
      ];

      change(data, status: RxStatus.success());
    }
    EasyLoading.dismiss();
  }
}
