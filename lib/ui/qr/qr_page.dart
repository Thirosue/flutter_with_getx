import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/templates/template.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/ui/qr/qr_page_controller.dart';
import 'package:get/get.dart';

class QrPage extends StatelessWidget {
  QrPage({Key? key}) : super(key: key);

  final controller = Get.put(QRPageController());

  @override
  Widget build(BuildContext context) {
    return Template(
      index: PageIndex.qr,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              child: const Text('QR Scan'),
              onPressed: () {
                controller.scanQr();
              },
            ),
          ),
        ),
      ),
    );
  }
}
