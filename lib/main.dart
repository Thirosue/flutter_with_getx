import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_with_getx/data/const/path.dart';
import 'package:flutter_with_getx/ui/card/card_page.dart';
import 'package:flutter_with_getx/ui/index/index_page.dart';
import 'package:flutter_with_getx/ui/login/login_page.dart';
import 'package:flutter_with_getx/ui/qr/qr_page.dart';
import 'package:flutter_with_getx/ui/settings/setting_page.dart';
import 'package:flutter_with_getx/ui/user/user_page.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final dark =
        SchedulerBinding.instance?.window.platformBrightness == Brightness.dark;
    debugPrint('darkmode: $dark');

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: dark ? ThemeData.dark() : ThemeData.light(),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      initialRoute: Path.login,
      getPages: [
        GetPage(name: Path.login, page: () => LoginPage()),
        GetPage(name: Path.index, page: () => IndexPage()),
        GetPage(name: Path.qr, page: () => const QrPage()),
        GetPage(name: Path.user, page: () => UserPage()),
        GetPage(name: Path.card, page: () => CardPage()),
        GetPage(name: Path.settings, page: () => const SettingPage()),
      ],
      builder: EasyLoading.init(),
    );
  }
}
