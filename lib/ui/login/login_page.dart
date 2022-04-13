import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_with_getx/data/const/validate_messages.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/ui/login/login_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  final controller = Get.put(LoginController(AuthRepository()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
          width: 400,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FormBuilderTextField(
                name: 'E-mail',
                initialValue: controller.email.value,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                onSaved: (value) => controller.email.value = value!,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: ValidateMessages.required),
                  FormBuilderValidators.email(
                      errorText: ValidateMessages.email),
                ]),
              ),
              Obx(
                () => FormBuilderTextField(
                  name: 'Password',
                  initialValue: controller.password.value,
                  obscureText: !controller.showPassword.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(controller.showPassword.value
                          ? FontAwesomeIcons.solidEye
                          : FontAwesomeIcons.solidEyeSlash),
                      onPressed: controller.togglePasswordVisible,
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: ValidateMessages.required),
                    FormBuilderValidators.minLength(
                      8,
                      errorText: ValidateMessages.min(8),
                    ),
                  ]),
                  onSaved: (value) => controller.password.value = value!,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        controller.login();
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(() {
                final textColor = FormStatus.error == controller.status.value
                    ? Colors.red
                    : null;
                return Text(
                  controller.message.value,
                  style: TextStyle(color: textColor),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
