import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/const/path.dart';
import 'package:flutter_with_getx/data/model/response/user.dart';
import 'package:flutter_with_getx/data/repository/user_repository.dart';
import 'package:flutter_with_getx/helpers/error_handler.dart';
import 'package:flutter_with_getx/helpers/validator.dart';
import 'package:flutter_with_getx/ui/user/update/user_update_controller.dart';
import 'package:get/get.dart';

class UserUpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(
    UserUpdateController(
      repository: UserRepository(),
    ),
  );

  UserUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Get.arguments;
    debugPrint(user.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザ更新'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: controller.obx(
            (state) => Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    initialValue: user.name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: Vaildators.emptyValidator,
                    onSaved: (value) => controller.name.value = value!,
                  ),
                  TextFormField(
                    initialValue: user.email,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    validator: Vaildators.emailValidator,
                    onSaved: (value) => controller.email.value = value!,
                  ),
                  TextFormField(
                    initialValue: user.tel,
                    decoration: const InputDecoration(
                      labelText: 'Tel',
                    ),
                    validator: Vaildators.emptyValidator,
                    onSaved: (value) => controller.tel.value = value!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Get.defaultDialog(
                              title: '確認',
                              middleText: 'この内容で変更します',
                              textCancel: 'いいえ',
                              textConfirm: 'はい',
                              onConfirm: () async {
                                await controller.save(user.id);

                                Get.toNamed(Path.user);
                                Get.snackbar(
                                  'ユーザ更新',
                                  'ユーザを更新しました',
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              },
                            );
                          }
                        },
                        child: const Text('変更する'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onLoading: const CircularProgressIndicator.adaptive(),
            onError: ErrorHandler.onError,
          ),
        ),
      ),
    );
  }
}
