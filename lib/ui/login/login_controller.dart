import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/model/response/session.dart';
import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/helpers/wait.dart';
import 'package:get/get.dart';

enum FormStatus { idle, loading, error, success }

class LoginController extends GetxController {
  final AuthRepository authRepository;
  final message = ''.obs;
  final status = (FormStatus.idle).obs;
  final showPassword = false.obs;

  final email = 'test@test.com'.obs;
  final password = 'password'.obs;

  LoginController(this.authRepository);

  @override
  void onInit() {
    super.onInit();
    status.listen((status) {
      if (FormStatus.success == status) {
        Get.offNamed('/');
      }
    });
  }

  void login() async {
    status.value = FormStatus.loading;
    debugPrint('email: ${email.value}, password: ${password.value}');

    final results = await authRepository.auth(
      email: email.value,
      password: password.value,
    );
    debugPrint(results.toString());

    final session = Session.toList(results.data!).first;
    final state = LocalState(
      name: '${session.firstName} ${session.lastName}',
      idToken: session.idToken,
      refreshToken: session.refreshToken,
      accessToken: session.accessToken,
    );

    debugPrint(state.toString());

    message.value = 'OK. Loading screen...';
    await wait(seconds: 1);
    status.value = FormStatus.success;
  }

  void togglePasswordVisible() {
    showPassword.value = !showPassword.value;
  }
}
