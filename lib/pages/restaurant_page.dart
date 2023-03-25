import 'package:first_version/componenets/primary_button.dart';
import 'package:first_version/componenets/secondary_button.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage('images/yamali_cham.jpg'),
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
                    child: Text("Yamali  cham", style: heading2),
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
                          "hay nahda, rabat, morocco",
                          style: p2,
                        )
                      ],
                    ),
                    SizedBox(
                      height: small,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow,
                          size: 50.0,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow,
                          size: 50.0,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow,
                          size: 50.0,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow,
                          size: 50.0,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow,
                          size: 50.0,
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
                        "Restaurant Description go here",
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
