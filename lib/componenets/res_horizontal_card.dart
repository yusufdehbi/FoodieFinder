import 'package:first_version/componenets/rating.dart';
import 'package:first_version/data/restaurants.dart';
import 'package:first_version/models/restaurant.dart';
import 'package:first_version/utilis/functions.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class ResHorizontalCard extends StatelessWidget {
  const ResHorizontalCard(
      {
      //   required this.restaurantName,
      // required this.rating,
      // required this.imageUrl,
      required this.doTask,
      required this.restaurant,
      super.key});

  // final String restaurantName;
  // final double rating;
  // final String imageUrl;
  final Function doTask;

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    double _distance =
        calcDistance(RestaurantsData.userLocation, restaurant.location);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          doTask();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: xsmall,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: heading3,
                    ),
                    SizedBox(
                      height: xsmall,
                    ),
                    Rating(
                      rating: restaurant.rating.toInt(),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: iconColor,
                ),
                Text(
                  '$_distance Km',
                  style: p2,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
