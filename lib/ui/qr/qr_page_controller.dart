import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_with_getx/ui/qr/barcode/barcode_page.dart';
import 'package:get/get.dart';

class QRPageController extends GetxController {
  String scannnedQrcode = 'sample code';

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
          "QR Code:$scannnedQrcode",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void showBarCodeView() {
    final rawSvg = Barcode.code128(
      useCode128A: false,
      useCode128C: false,
    ).toSvg(
      scannnedQrcode,
      width: 900,
      height: 450,
    );
    final barCode = SvgPicture.string(rawSvg);

    Get.to(
      () => const BarCodePage(),
      arguments: barCode,
      fullscreenDialog: true,
    );
  }
}
