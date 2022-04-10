import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/data/const/title_label.dart';
import 'package:get/get.dart';
import 'package:flutter_with_getx/data/const/path.dart';

class Template extends StatelessWidget {
  final int index;
  final Widget child;

  static final List<List<String>> naviList = [
    [TitleLabel.index, Path.index],
    [TitleLabel.qr, Path.qr],
    [TitleLabel.user, Path.user],
    [TitleLabel.settings, Path.settings],
  ];

  const Template({
    Key? key,
    required this.child,
    required this.index,
  }) : super(key: key);

  void move(int index) {
    Get.toNamed(naviList[index].last);
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
        title: Text(naviList[index].first),
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
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(TitleLabel.index),
              onTap: () => move(PageIndex.index),
            ),
            ListTile(
              leading: const Icon(Icons.qr_code_outlined),
              title: const Text(TitleLabel.qr),
              onTap: () => move(PageIndex.qr),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(TitleLabel.user),
              onTap: () => move(PageIndex.user),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(TitleLabel.settings),
              onTap: () => move(PageIndex.settings),
            ),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: TitleLabel.index,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: TitleLabel.qr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: TitleLabel.user,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: TitleLabel.settings,
          ),
        ],
      ),
    );
  }
}
