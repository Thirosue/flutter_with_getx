import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogActions {
  static List<Widget>? create({
    required BuildContext context,
    required Function()? onConfirm,
  }) {
    return [
      ElevatedButton(
        onPressed: () => Get.back(),
        child: const Text(
          "Cancel",
          style: TextStyle(color: Colors.lightBlue),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
      ElevatedButton(
        onPressed: onConfirm,
        child: const Text("OK"),
      )
    ];
  }
}
