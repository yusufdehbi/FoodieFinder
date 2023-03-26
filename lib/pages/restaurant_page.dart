import 'package:first_version/componenets/primary_button.dart';
import 'package:first_version/componenets/rating.dart';
import 'package:first_version/componenets/secondary_button.dart';
import 'package:first_version/models/restaurant.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class RestaurantPage extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    // Restaurant restaurant = Restaurant(
    // 'Dar Fawakih',
    // 'dar_fawakih_desc',
    // LatLng(33.99452490, -6.82504580),
    // 4.0,
    // "PIZZERIA Dar Alfawakih، Rabat, Morocco",
    // 'images/dar_alfawakih.jpg',
    // 2,
    // 'Morrocan');
    int leftStars = 5 - restaurant.rating.toInt();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(restaurant.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(restaurant.name, style: heading2),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: iconColor,
                        ),
                        SizedBox(
                          width: xsmall,
                        ),
                        Text(
                          restaurant.address,
                          style: p2,
                          overflow: TextOverflow.visible,
                        )
                      ],
                    ),
                    SizedBox(
                      height: small,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     Icon(
                    //       Icons.star_rate_rounded,
                    //       color: Colors.yellow,
                    //       size: 50.0,
                    //     ),
                    //     Icon(
                    //       Icons.star_rate_rounded,
                    //       color: Colors.yellow,
                    //       size: 50.0,
                    //     ),
                    //     Icon(
                    //       Icons.star_rate_rounded,
                    //       color: Colors.yellow,
                    //       size: 50.0,
                    //     ),
                    //     Icon(
                    //       Icons.star_rate_rounded,
                    //       color: Colors.yellow,
                    //       size: 50.0,
                    //     ),
                    //     Icon(
                    //       Icons.star_rate_rounded,
                    //       color: Colors.yellow,
                    //       size: 50.0,
                    //     ),
                    //   ],
                    // ),
                    restaurant.rating.toInt() == 5
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              restaurant.rating.toInt(),
                              (index) => const Icon(
                                Icons.star_rate_rounded,
                                color: Colors.yellow,
                                size: 45.0,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: List.generate(
                                  restaurant.rating.toInt(),
                                  (index) => const Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.yellow,
                                    size: 45.0,
                                  ),
                                ),
                              ),
                              Row(
                                children: List.generate(
                                  leftStars,
                                  (index) => Icon(
                                    Icons.star_rate_rounded,
                                    color: iconColor,
                                    size: 45.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: small,
                    ),
                    Text(
                      "10:55 AM - 18:56 PM",
                      style: p1,
                    ),
                    SizedBox(
                      height: small,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "About Restaurant",
                        style: heading3,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: xsmall,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        restaurant.description,
                        style: p1,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              Wrap(
                children: [
                  const PrimaryButton(textContent: "Make a reservation"),
                  SizedBox(
                    width: small,
                  ),
                  const PrimaryButton(textContent: "Call"),
                ],
              ),
              const SecondaryButton(textContent: "Get Directions in map"),
            ],
          )
        ],
      ),
    );
  }
}
