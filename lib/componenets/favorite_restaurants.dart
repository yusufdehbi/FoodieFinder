import 'package:first_version/componenets/res_card.dart';
import 'package:flutter/material.dart';

import '../utilis/style.dart';

class FavoriteRestaurants extends StatelessWidget {
  const FavoriteRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: const [
          ResCard(),
          ResCard(),
          ResCard(),
          ResCard(),
          ResCard(),
        ],
      ),
    );
  }
}
