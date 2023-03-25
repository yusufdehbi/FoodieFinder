import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatelessWidget {
  final Icon leadingIcon;
  final String textTile;
  final Function navigate;

  const CustomTile({
    super.key,
    required this.leadingIcon,
    required this.textTile,
    required this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate();
      },
      child: ListTile(
        leading: leadingIcon,
        title: Text(
          textTile,
          style: tileTitle,
        ),
        tileColor: background,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        trailing: const Icon(Icons.edit),
      ),
    );
  }
}
