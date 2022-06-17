import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_with_getx/component/templates/custom_theme.dart';
import 'package:flutter_with_getx/data/const/path.dart';
import 'package:flutter_with_getx/data/model/device/device.dart';
import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/data/repository/device_repository.dart';
import 'package:flutter_with_getx/data/repository/state_repository.dart';
import 'package:flutter_with_getx/firebase_options.dart';
import 'package:flutter_with_getx/ui/card/card_page.dart';
import 'package:flutter_with_getx/ui/card/pattern/card_sample_page.dart';
import 'package:flutter_with_getx/ui/card/pattern/card_sample_page_2.dart';
import 'package:flutter_with_getx/ui/card/pattern/card_sample_page_3.dart';
import 'package:flutter_with_getx/ui/card/pattern/card_sample_page_4.dart';
import 'package:flutter_with_getx/ui/index/index_page.dart';
import 'package:flutter_with_getx/ui/login/login_middleware.dart';
import 'package:flutter_with_getx/ui/login/login_page.dart';
import 'package:flutter_with_getx/ui/qr/qr_page.dart';
import 'package:flutter_with_getx/ui/settings/setting_page.dart';
import 'package:flutter_with_getx/ui/user/user_page.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const isRelease = bool.fromEnvironment('dart.vm.product');
  if (!isRelease) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

  final messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  final token = await messaging.getToken();
  debugPrint('🐯 FCM TOKEN: $token');
  StateRepository().save(LocalState(token: token!));
  DeviceRepository().save(Device(token: token));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final dark =
        SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
    debugPrint('darkmode: $dark');

    // redirect settings
    final loginMiddleWare = LoginMiddleWare(
      auth: AuthRepository(),
      state: StateRepository(),
    );
    loginMiddleWare.redirect(Path.index);

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: dark ? darkTheme : lightTheme,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      initialRoute: Path.login,
      getPages: [
        GetPage(name: Path.login, page: () => LoginPage()),
        GetPage(name: Path.index, page: () => IndexPage()),
        GetPage(name: Path.qr, page: () => QrPage()),
        GetPage(name: Path.user, page: () => UserPage()),
        GetPage(name: Path.card, page: () => CardPage()),
        GetPage(name: Path.settings, page: () => const SettingPage()),
        GetPage(name: Path.cardsample, page: () => const CardSamplePage()),
        GetPage(name: Path.cardsample2, page: () => const CardSamplePage2()),
        GetPage(name: Path.cardsample3, page: () => CardSamplePage3()),
        GetPage(name: Path.cardsample4, page: () => const CardSamplePage4()),
      ],
      builder: EasyLoading.init(),
    );
  }
}
