import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/model/response/user.dart';
import 'package:flutter_with_getx/data/repository/user_repository.dart';
import 'package:flutter_with_getx/helpers/wait.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class UserUpdateController extends GetxController with StateMixin<User> {
  final UserRepository repository;
  final User initData;

  final name = ''.obs;
  final email = ''.obs;
  final tel = ''.obs;

  UserUpdateController({
    required this.repository,
    required this.initData,
  });

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future<void> save() async {
    try {
      change(null, status: RxStatus.loading());
      await wait(seconds: 2);
      final data = User(
        id: initData.id,
        name: name.value,
        email: email.value,
        tel: tel.value,
      );
      debugPrint(data.toString());
      await repository.update(data);
      change(data, status: RxStatus.success());
    } catch (exception, stackTrace) {
      await Sentry.captureException(exception, stackTrace: stackTrace);
      debugPrintStack(stackTrace: stackTrace);
      debugPrint("error captured...");
      change(null, status: RxStatus.error('Something is wrong.'));
    }
  }
}
