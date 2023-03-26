import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/restaurant.dart';

class ResCard extends StatelessWidget {
  final Restaurant restaurant;
  const ResCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: xsmall),
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: AssetImage(restaurant.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8.0),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color.fromRGBO(0, 0, 0, 0.75), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
            borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          restaurant.name,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
