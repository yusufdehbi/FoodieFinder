import 'package:first_version/componenets/custom_tile.dart';
import 'package:first_version/componenets/res_card.dart';
import 'package:first_version/models/user.dart';
import 'package:first_version/pages/favorite_restaurants_page.dart';
import 'package:first_version/utilis/extentions.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

import '../componenets/favorite_restaurants_horizontal.dart';

class ProfilePage extends StatelessWidget {
  final Function changePage;
  const ProfilePage({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    List<User> users = [
      User("youssef dehbi", "yusufdehbi@gmail.com", '0670307326', 'youssef1234',
          LatLng(0, 0))
    ];

    var currentUser = users[0];

    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/res1.jpg'),
                    radius: 50,
                  ),
                  SizedBox(
                    width: medium,
                  ),
                  Text(
                    currentUser.name.capitalize(),
                    style: GoogleFonts.poppins(fontSize: 23.0),
                  )
                ],
              ),
              SizedBox(
                height: large,
              ),
              Text(
                'Personal Inforamtion',
                style: heading2,
              ),
              SizedBox(
                height: medium,
              ),
              Column(
                children: [
                  CustomTile(
                      leadingIcon: const Icon(Icons.person),
                      textTile: currentUser.name),
                  SizedBox(
                    height: xsmall,
                  ),
                  CustomTile(
                      leadingIcon: const Icon(Icons.mail),
                      textTile: currentUser.mail),
                  SizedBox(
                    height: xsmall,
                  ),
                  const CustomTile(
                    leadingIcon: Icon(Icons.password),
                    textTile: "*********",
                  ),
                ],
              ),
              SizedBox(
                height: large,
              ),
              Text(
                'Favorite Restaurants',
                style: heading2,
              ),
              SizedBox(
                height: medium,
              ),
              const FavoriteRestaurantsHorizontal(),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const FavoriteRestaurantsPage(),
                    //   ),
                    // );
                    changePage();
                  },
                  child: Text(
                    "show more",
                    style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: accent),
                  ),
                ),
              ),
              SizedBox(
                height: medium,
              ),
              Text(
                'Preferences',
                style: heading2,
              ),
              SizedBox(
                height: medium,
              ),
              Column(
                children: [
                  const CustomTile(
                      leadingIcon: Icon(Icons.notifications),
                      textTile: "Notification"),
                  SizedBox(
                    height: xsmall,
                  ),
                  const CustomTile(
                    leadingIcon: Icon(Icons.language),
                    textTile: "Langugae",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}