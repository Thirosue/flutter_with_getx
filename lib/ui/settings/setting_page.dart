import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_with_getx/component/templates/template.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/ui/settings/setting_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());

    return Template(
      index: PageIndex.settings,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FormBuilderSwitch(
              name: 'DarkMode',
              initialValue: false,
              title: const Text('ダークモード'),
              onChanged: controller.changeTheme,
            )
          ],
        ),
      ),
    );
  }
}
