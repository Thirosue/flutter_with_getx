import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BarCodePage extends StatelessWidget {
  const BarCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SvgPicture picture = Get.arguments;
    final deviceWidth = MediaQuery.of(context).size.width / 1.2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BarCode View'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            debugPrint('show barcode modal');
          },
          child: SizedBox(
            width: deviceWidth,
            height: deviceWidth / 2,
            child: picture,
          ),
        ),
      ),
    );
  }
}
