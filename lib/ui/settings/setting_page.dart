import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/templates/template.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/ui/settings/setting_controller.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());

    Widget _label({required String label}) {
      return Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      );
    }

    Widget _tableRow({
      required String label,
      required String value,
      bool change = false,
    }) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: _label(
                label: label,
              ),
            ),
            AutoSizeText(
              value,
              style: const TextStyle(
                fontFamily: 'notosans',
                fontSize: 14,
                color: Colors.grey,
              ),
              minFontSize: 10,
              maxLines: 1,
            ),
            const SizedBox(
              width: 4,
            ),
            if (change)
              const Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Colors.grey,
              )
          ],
        ),
      );
    }

    return Template(
      index: PageIndex.settings,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Obx(
            () => Table(
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: _label(
                              label: 'ダークモード',
                            ),
                          ),
                          Switch(
                            value: controller.on.value,
                            onChanged: controller.changeTheme,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        debugPrint('change email');
                        controller.authenticate();
                      },
                      child: _tableRow(
                        label: 'メールアドレス',
                        value: 'sample@example.com',
                        change: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
