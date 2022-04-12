import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_with_getx/data/const/path.dart';
import 'package:flutter_with_getx/ui/index/index_page.dart';
import 'package:flutter_with_getx/ui/login/login_page.dart';
import 'package:flutter_with_getx/ui/qr/qr_page.dart';
import 'package:flutter_with_getx/ui/settings/setting_page.dart';
import 'package:flutter_with_getx/ui/user/user_page.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://4709d9b8073a489cb875810865686c8a@o277236.ingest.sentry.io/6325413';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Path.login,
      getPages: [
        GetPage(name: Path.login, page: () => LoginPage()),
        GetPage(name: Path.index, page: () => IndexPage()),
        GetPage(name: Path.qr, page: () => const QrPage()),
        GetPage(name: Path.user, page: () => UserPage()),
        GetPage(name: Path.settings, page: () => const SettingPage()),
      ],
      builder: EasyLoading.init(),
    );
  }
}
