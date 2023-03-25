import 'package:first_version/componenets/input_field.dart';
import 'package:first_version/componenets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../utilis/style.dart';

class EditMailPage extends StatelessWidget {
  final String mailAdress;
  const EditMailPage({super.key, required this.mailAdress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit E-mail Adresse"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(
                    leadingIcon: Icons.mail_outline,
                    hintText: mailAdress,
                    isDiable: true,
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: large,
                  ),
                  Text(
                    'Type your new email address',
                    style: heading3,
                  ),
                  SizedBox(
                    height: medium,
                  ),
                  const InputField(
                    leadingIcon: Icons.mail_outline,
                    hintText: "E-mail",
                    isDiable: false,
                    inputType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  PrimaryButton(
                    textContent: "Save",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
