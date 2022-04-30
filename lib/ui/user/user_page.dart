import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/templates/template.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/data/repository/user_repository.dart';
import 'package:flutter_with_getx/helpers/error_handler.dart';
import 'package:flutter_with_getx/ui/user/update/user_update_page.dart';
import 'package:flutter_with_getx/ui/user/user_controller.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);

  final controller = Get.put(UserController(UserRepository()));

  @override
  Widget build(BuildContext context) {
    return Template(
      index: PageIndex.user,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: controller.obx(
            (state) => ListView.separated(
              itemCount: state!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(
                        () => UserUpdatePage(),
                        arguments: state[index],
                        fullscreenDialog: true,
                      );
                    },
                    title: Text(state[index].name),
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.more_vert),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
            onLoading: const SizedBox.shrink(),
            onError: ErrorHandler.onError,
          ),
        ),
      ),
    );
  }
}
