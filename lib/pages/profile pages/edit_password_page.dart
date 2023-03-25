import 'package:first_version/componenets/password_field.dart';
import 'package:flutter/material.dart';

import '../../componenets/input_field.dart';
import '../../componenets/primary_button.dart';
import '../../utilis/style.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Password"),
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
                  Text(
                    'Edit your password',
                    style: heading3,
                  ),
                  SizedBox(
                    height: medium,
                  ),
                  // const InputField(
                  //   leadingIcon: Icons.password_outlined,
                  //   hintText: "Old password",
                  //   isDiable: false,
                  //   inputType: TextInputType.visiblePassword,
                  // ),
                  const PasswordField(hintText: 'Old password'),
                  SizedBox(
                    height: small,
                  ),
                  // const InputField(
                  //   leadingIcon: Icons.password_outlined,
                  //   hintText: "New password",
                  //   isDiable: false,
                  //   inputType: TextInputType.visiblePassword,
                  // ),
                  const PasswordField(hintText: 'New Password'),
                  SizedBox(
                    height: small,
                  ),
                  // const InputField(
                  //   leadingIcon: Icons.password_outlined,
                  //   hintText: "Re-enter the new password",
                  //   isDiable: false,
                  //   inputType: TextInputType.visiblePassword,
                  // ),
                  const PasswordField(hintText: 'Re-enter the new password'),
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
