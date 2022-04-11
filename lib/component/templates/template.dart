import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/atoms/drawer_item.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/data/const/title_label.dart';
import 'package:flutter_with_getx/data/model/menu.dart';
import 'package:get/get.dart';
import 'package:flutter_with_getx/data/const/path.dart';

class Template extends StatelessWidget {
  final int index;
  final Widget child;

  static final List<Menu> menuList = [
    const Menu(
        title: TitleLabel.index,
        path: Path.index,
        icon: Icons.home,
        index: PageIndex.index),
    const Menu(
        title: TitleLabel.qr,
        path: Path.qr,
        icon: Icons.qr_code,
        index: PageIndex.qr),
    const Menu(
        title: TitleLabel.user,
        path: Path.user,
        icon: Icons.person,
        index: PageIndex.user),
    const Menu(
        title: TitleLabel.settings,
        path: Path.settings,
        icon: Icons.settings,
        index: PageIndex.settings),
  ];

  const Template({
    Key? key,
    required this.child,
    required this.index,
  }) : super(key: key);

  void move(int index) {
    Get.toNamed(menuList[index].path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(menuList[index].title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            DrawerItem(menu: menuList[0]),
            DrawerItem(menu: menuList[1]),
            DrawerItem(menu: menuList[2]),
            DrawerItem(menu: menuList[3]),
          ],
        ),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: move,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(menuList[0].icon),
            label: menuList[0].title,
          ),
          BottomNavigationBarItem(
            icon: Icon(menuList[1].icon),
            label: menuList[1].title,
          ),
          BottomNavigationBarItem(
            icon: Icon(menuList[2].icon),
            label: menuList[2].title,
          ),
          BottomNavigationBarItem(
            icon: Icon(menuList[3].icon),
            label: menuList[3].title,
          ),
        ],
      ),
    );
  }
}
