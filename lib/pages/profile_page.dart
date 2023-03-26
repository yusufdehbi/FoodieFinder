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
import '../models/restaurant.dart';

class ProfilePage extends StatelessWidget {
  final Function changePage;
  const ProfilePage({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    // List<User> users = [
    //   User("youssef dehbi", "yusufdehbi@gmail.com", '0670307326', 'youssef1234',
    //       LatLng(0, 0), "images/rec1.jpg")
    // ];
    List<Restaurant> restaurants = [
      Restaurant(
          'Dar Fawakih',
          'dar_fawakih_desc',
          LatLng(33.99452490, -6.82504580),
          4.0,
          "PIZZERIA Dar Alfawakih، Rabat, Morocco",
          'images/dar_alfawakih.jpg',
          2,
          'Morrocan'),
      Restaurant(
          'Yamali Acham',
          'yamali_cham_desc',
          LatLng(34.00243980, -6.85094190),
          5.0,
          "PYamal Acham, Avenue Fal Ould Oumeir, Rabat, Morocco",
          'images/yamali_cham.jpg',
          3,
          'Cham'),
      Restaurant(
          'KFC',
          'kfc_desc',
          LatLng(34.02135290, -6.83960620),
          3.0,
          "KFC- Madina Rabat, N1, Rabat, Morocco",
          'images/kfc.png',
          2,
          'Fast Food'),
      Restaurant(
          'MacDonald',
          'macdonald_desc',
          LatLng(34.03122000, -6.81662600),
          2.0,
          "McDonald's, Avenue de Fès, Salé, Morocco",
          'images/mcdonalds.jpg',
          2,
          'Fast Food'),
      Restaurant(
          'Abtal Acham',
          'abtal',
          LatLng(34.01628490, -6.83462930),
          4.0,
          "Chawarma Abtal Acham Rabat ville, Avenue Abou Faris Al Marini, Rabat, Morocco",
          'images/abtal_cham.jpg',
          1,
          'Cham'),
      Restaurant(
          'Dar Najji',
          'dar_najji_desc',
          LatLng(34.02183530, -6.84194150),
          4.0,
          "Dar Naji Rabat Hassan, Avenue Jazirat Al Arabe, Rabat, Morocco",
          'images/dar_naji.jpg',
          2,
          'Mix'),
      Restaurant(
          'Chizz Mia',
          'chizz_mia_desc',
          LatLng(33.981074, -6.826227),
          3.0,
          "Chizza Mia takkadoum rabat",
          'images/chizza_mia.jpg',
          2,
          'Fast Food'),
    ];

    var currentUser = User("youssef dehbi", "yusufdehbi@gmail.com",
        '0670307326', 'youssef1234', LatLng(0, 0), 'images/dar_alfawakih.jpg');

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
                  CircleAvatar(
                    backgroundImage: AssetImage(currentUser.imageUrl),
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
              FavoriteRestaurantsHorizontal(
                restaurants: restaurants,
              ),
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
