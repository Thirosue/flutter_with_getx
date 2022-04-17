import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_with_getx/component/molecules/dialog_actions.dart';
import 'package:flutter_with_getx/data/const/path.dart';
import 'package:flutter_with_getx/data/const/validate_messages.dart';
import 'package:flutter_with_getx/data/model/response/user.dart';
import 'package:flutter_with_getx/data/repository/user_repository.dart';
import 'package:flutter_with_getx/helpers/error_handler.dart';
import 'package:flutter_with_getx/ui/user/update/user_update_controller.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class UserUpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  UserUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Get.arguments;

    final controller = Get.put(
      UserUpdateController(
        repository: UserRepository(),
        initData: user,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Update'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: controller.obx(
            (state) => FormBuilder(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    name: 'Name',
                    initialValue: user.name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: FormBuilderValidators.required(
                        errorText: ValidateMessages.required),
                    onSaved: (value) => controller.name.value = value!,
                  ),
                  FormBuilderTextField(
                    name: 'E-mail',
                    initialValue: user.email,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: ValidateMessages.required),
                      FormBuilderValidators.email(
                          errorText: ValidateMessages.email),
                    ]),
                    onSaved: (value) => controller.email.value = value!,
                  ),
                  FormBuilderTextField(
                    name: 'Tel',
                    initialValue: user.tel,
                    decoration: const InputDecoration(
                      labelText: 'Tel',
                    ),
                    validator: FormBuilderValidators.required(
                        errorText: ValidateMessages.required),
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
                        child: const Text('変更する'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Get.defaultDialog(
                              title: '確認',
                              middleText: 'この内容で変更します',
                              radius: 10.0,
                              actions: DialogActions.create(
                                context: context,
                                onConfirm: () async {
                                  await controller.save();

                                  Get.toNamed(Path.user);
                                  Get.snackbar(
                                    'ユーザ更新',
                                    'ユーザを更新しました',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onError: ErrorHandler.onError,
          ),
        ),
      ),
    );
  }
}
