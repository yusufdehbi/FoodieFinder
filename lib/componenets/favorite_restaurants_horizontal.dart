import 'package:first_version/componenets/res_card.dart';
import 'package:first_version/models/restaurant.dart';
import 'package:flutter/material.dart';

class FavoriteRestaurantsHorizontal extends StatelessWidget {
  final List<Restaurant> restaurants;
  const FavoriteRestaurantsHorizontal({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return ResCard(restaurant: restaurants[index]);
        },
      ),
    );
  }
}
