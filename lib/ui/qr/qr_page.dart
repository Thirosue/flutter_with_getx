import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/atoms/clickable_icon_card.dart';
import 'package:flutter_with_getx/component/templates/template.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/ui/qr/qr_page_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class QrPage extends StatelessWidget {
  QrPage({Key? key}) : super(key: key);

  final controller = Get.put(QRPageController());

  @override
  Widget build(BuildContext context) {
    return Template(
      index: PageIndex.qr,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClickAbleIconCard(
              onClick: () => controller.scanQr(),
              icon: Icons.qr_code_scanner,
              label: 'Scan Qr',
            ),
            ClickAbleIconCard(
              onClick: () => debugPrint('barcode create'),
              icon: CupertinoIcons.barcode,
              label: 'Create BarCode',
            ),
          ],
        ),
      ),
    );
  }
}
