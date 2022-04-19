import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_with_getx/data/model/response/c_card.dart';
import 'package:flutter_with_getx/data/repository/card_repository.dart';
import 'package:flutter_with_getx/helpers/wait.dart';
import 'package:get/get.dart';

class CardDetailController extends GetxController {
  final CardRepository repository;
  final CCard initData;

  final on = false.obs;

  CardDetailController({
    required this.repository,
    required this.initData,
  });

  Future<void> delete() async {
    try {
      EasyLoading.show(status: 'loading...');
      await wait(seconds: 2);
      await repository.delete(initData.id);
    } catch (exception, stackTrace) {
      // await Sentry.captureException(exception, stackTrace: stackTrace);
      debugPrintStack(stackTrace: stackTrace);
      debugPrint("error captured...");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> toggle(bool? toggle) async {
    on.value = toggle!;
  }
}
