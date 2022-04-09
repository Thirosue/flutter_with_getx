import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/model/response/session.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:get/get.dart';

enum FormStatus { idle, loading, error, success }

class LoginController extends GetxController {
  final AuthRepository repository;
  final message = ''.obs;
  final status = (FormStatus.idle).obs;

  final emailController = TextEditingController(text: 'test@test.com');
  final passwordController = TextEditingController();

  LoginController(this.repository);

  @override
  void onInit() {
    super.onInit();
    status.listen((status) {
      if (FormStatus.success == status) {
        Get.offNamed('/');
      }
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() async {
    status.value = FormStatus.idle;
    message.value = 'Cheking input...';
    await wait(seconds: 1);
    _validate();

    if (FormStatus.idle == status.value) {
      status.value = FormStatus.loading;

      final results = await repository.auth();
      debugPrint(results.toString());

      final session = Session.toList(results.data!);
      debugPrint(session.first.toString());

      message.value = 'OK. Loading screen...';
      await wait(seconds: 1);
      status.value = FormStatus.success;
    }
  }

  void _validate() {
    final isNotEmail = !GetUtils.isEmail(emailController.text.trim());
    final isNotPassword = passwordController.text.trim().length < 8;
    if (isNotEmail || isNotPassword) {
      status.value = FormStatus.error;
      message.value = 'Invalid email or Password';
    }
  }
}

Future<void> wait({required int seconds}) async {
  await Future.delayed(Duration(seconds: seconds));
}
