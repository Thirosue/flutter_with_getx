import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:flutter_with_getx/data/model/response/session.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/data/repository/state_repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

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

    final state = Hive.box<LocalState>('state').getAt(0);
    debugPrint(state.toString());

    if (state != null && state.idToken!.isNotEmpty) {
      debugPrint('Refresh Token stored. value: ${state.idToken}');

      refreshToken().then((result) {
        if (result) {
          debugPrint('token refreshed... go to index page.');

          // auto login
          // Get.toNamed(route!);
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

    return null;
  }
}
