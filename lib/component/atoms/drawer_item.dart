import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_with_getx/data/model/menu.dart';

class DrawerItem extends StatelessWidget {
  final Menu menu;

  const DrawerItem({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(menu.icon),
      title: Text(menu.title),
      onTap: () => Get.toNamed(menu.path),
    );
  }
}
