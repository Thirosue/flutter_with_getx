import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/atoms/drawer_item.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/data/const/title_label.dart';
import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:flutter_with_getx/data/model/menu.dart';
import 'package:get/get.dart';
import 'package:flutter_with_getx/data/const/path.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Template extends StatelessWidget {
  final int index;
  final Widget child;

  static final List<Menu> menuList = [
    const Menu(
      title: TitleLabel.index,
      path: Path.index,
      icon: Icons.home,
      index: PageIndex.index,
    ),
    const Menu(
      title: TitleLabel.qr,
      path: Path.qr,
      icon: Icons.qr_code,
      index: PageIndex.qr,
    ),
    const Menu(
      title: TitleLabel.user,
      path: Path.user,
      icon: Icons.person,
      index: PageIndex.user,
    ),
    const Menu(
      title: TitleLabel.card,
      path: Path.card,
      icon: Icons.card_membership,
      index: PageIndex.card,
    ),
    const Menu(
      title: TitleLabel.settings,
      path: Path.settings,
      icon: Icons.settings,
      index: PageIndex.settings,
    ),
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
        flexibleSpace: Image.network(
          'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
          fit: BoxFit.cover,
        ),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
        elevation: 0,
        title: Text(menuList[index].title),
      ),
      // extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 130,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/sample_drawer.jpeg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Column(
              children: menuList.map((menu) => DrawerItem(menu: menu)).toList(),
            ),
          ],
        ),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Theme.of(context).colorScheme.tertiary,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        showUnselectedLabels: true,
        onTap: move,
        items: menuList
            .map(
              (menu) => BottomNavigationBarItem(
                icon: Icon(menu.icon),
                label: menu.title,
              ),
            )
            .toList(),
      ),
    );
  }
}
