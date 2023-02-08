import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone_ui/routes/appRoutes.dart';
import 'package:udemy_clone_ui/signin/signin_controller.dart';
import 'package:udemy_clone_ui/utils/customWidgets.dart';
import 'package:udemy_clone_ui/utils/validations.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(AppRoutes.signIn),
      // backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: GetBuilder<SignInController>(
            builder: (controller) {
              return Container(
                height: Get.height,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    // mainAxisAlignment : MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // Image.asset(
                      //   "assests/ffflll.png",
                      //   height: 50,
                      // ),
                      Spacer(),
                      TextFormField(
                        controller: controller.userNameController,
                        validator: Validations.fieldIsEmail,
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.passwordController,
                        validator: Validations.fieldIsPw,
                        decoration: const InputDecoration(hintText: "Password"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            controller.loginData();

                          },
                          child: const Text("Submit")),
                      Spacer(),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
