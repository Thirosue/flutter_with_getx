import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_with_getx/data/model/response/user.dart';
import 'package:flutter_with_getx/data/repository/user_repository.dart';
import 'package:flutter_with_getx/helpers/wait.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<List<User>> {
  final UserRepository repository;
  UserController(this.repository);

  final keyword = ''.obs;

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
      final users = User.toList(results.data!);
      change(users, status: RxStatus.success());
    } catch (e) {
      debugPrint(e.toString());
      change(null, status: RxStatus.error('Something is wrong.'));
    } finally {
      EasyLoading.dismiss();
    }
  }
}
