import 'package:flutter/material.dart';
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
            _cardMenu(
              context: context,
              onClick: () => controller.scanQr(),
              icon: Icons.qr_code_scanner,
              label: 'Scan Qr',
            ),
            _cardMenu(
              context: context,
              onClick: () => debugPrint('barcode create'),
              icon: CupertinoIcons.barcode,
              label: 'Create BarCode',
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardMenu({
    required BuildContext context,
    required Function()? onClick,
    required IconData? icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 12,
            ),
            Icon(
              icon,
              size: 40,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 3,
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
