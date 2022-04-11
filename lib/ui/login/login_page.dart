import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/helpers/validator.dart';
import 'package:flutter_with_getx/ui/login/login_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                validator: Vaildators.emailValidator,
                onSaved: (value) => controller.email.value = value!,
              ),
              Obx(
                () => TextFormField(
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
                  validator: Vaildators.passwordValidator,
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
