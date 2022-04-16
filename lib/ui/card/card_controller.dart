import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_with_getx/data/model/response/c_card.dart';
import 'package:flutter_with_getx/data/repository/card_repository.dart';
import 'package:flutter_with_getx/helpers/wait.dart';
import 'package:get/get.dart';

class CardController extends GetxController with StateMixin<List<CCard>> {
  final CardRepository repository;
  CardController(this.repository);

  @override
  void onInit() async {
    super.onInit();
    findAll();
  }

  void findAll() async {
    try {
      EasyLoading.show(status: 'loading...');
      await wait(seconds: 1);
      final results = await repository.findAll();
      final cards = CCard.toList(results.data!);
      debugPrint(cards.toString());
      change(cards, status: RxStatus.success());
    } catch (e) {
      debugPrint(e.toString());
      change(null, status: RxStatus.error('Something is wrong.'));
    } finally {
      EasyLoading.dismiss();
    }
  }
}
