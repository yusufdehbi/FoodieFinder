import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String textContent;
  const SecondaryButton({super.key, required this.textContent});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.green,
        shadowColor: Colors.transparent,
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: const Size(100, 40),
      ),
      onPressed: () {},
      child: Text(
        textContent,
        style: tButtonSecondary,
      ),
    );
  }
}
