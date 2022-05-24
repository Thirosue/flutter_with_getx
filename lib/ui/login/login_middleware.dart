import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:flutter_with_getx/data/model/response/session.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/data/repository/state_repository.dart';
import 'package:get/get.dart';

class LoginMiddleWare extends GetMiddleware {
  final AuthRepository auth;
  final StateRepository state;

  LoginMiddleWare({
    required this.auth,
    required this.state,
  });

  Future<bool> refreshToken() async {
    try {
      final results = await auth.refresh();
      final session = Session.toList(results.data!).first;

      final value = LocalState(
        name: '${session.firstName} ${session.lastName}',
        idToken: session.idToken,
        refreshToken: session.refreshToken,
        accessToken: session.accessToken,
      );
      state.write(value);

      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  RouteSettings? redirect(String? route) {
    debugPrint('login onInit. check token');

    final session = state.read();
    debugPrint(session.toString());
    if (session.idToken == null || session.idToken!.isEmpty) {
      return null;
    }

    debugPrint('Refresh Token stored. value: ${session.idToken}');
    refreshToken().then((result) {
      if (result) {
        debugPrint('token refreshed... go to index page.');

        // auto login
        Get.toNamed(route!);
        if (!Get.isSnackbarOpen) {
          Get.snackbar(
            'Login',
            "Auto Logged in...",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      }
    });

    return null;
  }
}
