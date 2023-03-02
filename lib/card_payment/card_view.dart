import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/validations.dart';
import 'card_controller.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardController>(
      init: CardController(),
      builder: (controller) => ScaleTransition(
        scale: controller.scaleAnimation,
        child: AlertDialog(
          title: TextButton(
              onPressed: () {
                // controller.screenSet("Payment Method");
              },
              child: const Text('Payment Method')),
          content: Form(
            key: controller.cardFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildListTile(controller.cardHolderNameController, "Card holder*",
                    "Card holder Name"),
                const SizedBox(
                  height: 20,
                ),
                buildListTile(
                    controller.cardNumberController, "Card Number", "Card Number"),
                const SizedBox(
                  height: 20,
                ),
                buildListTile(controller.expYearController,
                     "month/year", "03/26"),
                 buildListTile(controller.cvcController,
                     "cvc", "***")
              ],
            ),
          ),
          actions: [
            TextButton(
                child: const Text("Submit"),
                onPressed: () {
                  controller.cardValidations(context);
                }),
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => controller.inToHomeLogIn(context),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(
      TextEditingController controller, String text, String hinText) {
    return ListTile(
      title: Text(text),
      subtitle: Container(
        width: 500,
        child: TextFormField(
          controller: controller,
          validator: Validations.nullOnFieldNotEmpty,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hinText),
        ),
      ),
    );
  }
}
