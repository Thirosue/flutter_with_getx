import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BarCodePage extends StatelessWidget {
  const BarCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SvgPicture barCode = Get.arguments;
    final deviceHeight = MediaQuery.of(context).size.height / 1.6;
    final deviceWidth = MediaQuery.of(context).size.width / 1.2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BarCode View'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            final rotateBarcode = RotatedBox(
              quarterTurns: 1,
              child: SizedBox(
                width: deviceHeight,
                child: barCode,
              ),
            );

            Get.dialog(
              AlertDialog(
                content: rotateBarcode,
              ),
            );
          },
          child: SizedBox(
            width: deviceWidth,
            child: barCode,
          ),
        ),
      ),
    );
  }
}
