import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_with_getx/data/model/response/c_card.dart';
import 'package:flutter_with_getx/data/repository/card_repository.dart';
import 'package:flutter_with_getx/helpers/wait.dart';
import 'package:get/get.dart';

class CardDetailController extends GetxController with StateMixin<void> {
  final CardRepository repository;
  final CCard initData;

  CardDetailController({
    required this.repository,
    required this.initData,
  });

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future<void> delete() async {
    try {
      EasyLoading.show(status: 'loading...');
      await wait(seconds: 2);
      await repository.delete(initData.id);
      change(null, status: RxStatus.success());
    } catch (exception, stackTrace) {
      // await Sentry.captureException(exception, stackTrace: stackTrace);
      debugPrintStack(stackTrace: stackTrace);
      debugPrint("error captured...");
      change(null, status: RxStatus.error('Something is wrong.'));
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> toggle(bool? toggle) async {}
}
