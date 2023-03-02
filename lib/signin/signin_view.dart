import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repositories/sign_in_repository.dart';
import '../utils/validations.dart';
import 'signin_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => ScaleTransition(
        scale: controller.scaleAnimation,
        child: AlertDialog(
          title: ListTile(
            leading: TextButton(
                onPressed: () {
                  controller.screenSet("Login");
                },
                child: const Text('Login')),
            trailing: TextButton(
                onPressed: () {
                  controller.screenSet("SignUp");
                },
                child: const Text('SignUp')),
          ),
          content: controller.setPage == "Login"
              ? Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: controller.userNameController,
                        validator: Validations.fieldIsEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Email"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.passwordController,
                        validator: Validations.fieldIsPw,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Password"),
                      ),
                    ],
                  ),
                )
              : Form(
                  key: controller.signUPFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: controller.signUpEmailController,
                        validator: Validations.fieldIsEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Email"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.signUpMobileController,
                        validator: Validations.nullOnFieldNotEmpty,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Mobile"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.signUpPasswordController,
                        validator: Validations.fieldIsPw,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Password"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.conformPasswordController,
                        validator: Validations.fieldIsPw,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Conform Password"),
                      ),
                    ],
                  ),
                ),
          actions: [
            controller.setPage == "Login"
                ? TextButton(
                    child: const Text("Login"),
                    onPressed: () {
                      controller.loginValidations(context);
                    })
                : TextButton(
                    child: const Text("SignUp"),
                    onPressed: () {
                      controller.signUpValidations(context);
                    }),
            TextButton(
              child: const Text("Close"),
              onPressed: () => controller.inToHomeLogIn(context),
            ),
          ],
        ),
      ),
    );
  }
}
