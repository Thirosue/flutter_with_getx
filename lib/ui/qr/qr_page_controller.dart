import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class QRPageController extends GetxController {
  String scannnedQrcode = '';

  @override
  void onInit() async {
    super.onInit();
    scanQr();
  }

  Future<void> scanQr() async {
    try {
      scannnedQrcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        false,
        ScanMode.QR,
      );

      if (scannnedQrcode != "-1") {
        Get.snackbar(
          'Result',
          "QR Code:" + scannnedQrcode,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
