import 'package:first_version/componenets/res_horizontal_card.dart';
import 'package:first_version/models/restaurant.dart';
import 'package:first_version/pages/restaurant_page.dart';
import 'package:flutter/material.dart';

class RestaurantListView extends StatelessWidget {
  final List<Restaurant> restaurants;

  const RestaurantListView({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return ResHorizontalCard(
            restaurant: restaurants[index],
            doTask: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RestaurantPage(restaurant: restaurants[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
