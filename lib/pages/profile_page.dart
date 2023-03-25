import 'package:first_version/componenets/custom_tile.dart';
import 'package:first_version/componenets/res_card.dart';
import 'package:first_version/models/user.dart';
import 'package:first_version/pages/favorite_restaurants_page.dart';
import 'package:first_version/pages/profile%20pages/edit_email_page.dart';
import 'package:first_version/pages/profile%20pages/edit_name_page.dart';
import 'package:first_version/pages/profile%20pages/edit_password_page.dart';
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
                    textTile: currentUser.name,
                    navigate: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditNamePage(currentValue: currentUser.name),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: xsmall,
                  ),
                  CustomTile(
                    leadingIcon: const Icon(Icons.mail),
                    textTile: currentUser.mail,
                    navigate: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditMailPage(mailAdress: currentUser.mail),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: xsmall,
                  ),
                  CustomTile(
                    leadingIcon: const Icon(Icons.password),
                    textTile: "*********",
                    navigate: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditPasswordPage(),
                        ),
                      );
                    },
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
                  CustomTile(
                    leadingIcon: const Icon(Icons.notifications),
                    textTile: "Notification",
                    navigate: () {},
                  ),
                  SizedBox(
                    height: xsmall,
                  ),
                  CustomTile(
                    leadingIcon: const Icon(Icons.language),
                    textTile: "Langugae",
                    navigate: () {},
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
