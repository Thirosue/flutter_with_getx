import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/model/response/user.dart';
import 'package:flutter_with_getx/data/repository/user_repository.dart';
import 'package:flutter_with_getx/helpers/wait.dart';
import 'package:get/get.dart';

class UserUpdateController extends GetxController with StateMixin<User> {
  final UserRepository repository;

  final name = ''.obs;
  final email = ''.obs;
  final tel = ''.obs;

  UserUpdateController({
    required this.repository,
  });

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future<void> save(int id) async {
    try {
      change(null, status: RxStatus.loading());
      await wait(seconds: 2);
      final data = User(
        id: id,
        name: name.value,
        email: email.value,
        tel: tel.value,
      );

      await repository.update(data);
      change(data, status: RxStatus.success());
    } catch (e) {
      debugPrint(e.toString());
      change(null, status: RxStatus.error('Something is wrong.'));
    }
  }
}
