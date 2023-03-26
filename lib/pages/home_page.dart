import 'package:first_version/componenets/cuisine_type_filter.dart';
import 'package:first_version/componenets/map_view.dart';
import 'package:first_version/componenets/search_bar_typeahead.dart';
import 'package:first_version/pages/restaurant_page.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';

import '../componenets/list_view.dart';
import '../componenets/price_filter.dart';
import '../componenets/search_bar.dart';
import '../models/restaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMapView = true;
  bool isFiltersVisible = false;
  int pageIndex = 1;
  LatLng centerCoordinate = LatLng(34.0500322, -6.8127248);

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
    Restaurant('Chizz Mia', 'chizz_mia_desc', LatLng(33.981074, -6.826227), 3.0,
        "Chizza Mia takkadoum rabat", 'images/chizza_mia.jpg', 2, 'Fast Food'),
  ];

  Restaurant _matchRestaurant =
      Restaurant("", "", LatLng(33.9715904, -6.8498129), 0, "", "", 1, "");

  void message(String str) {
    Fluttertoast.showToast(
      msg: "Home Page Message: $str",
    );

    //   void GoToRestaurantPage() {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) =>
    //                 RestaurantPage(restaurant: _matchRestaurant)));
    //   }
    // }

    //  void _updateMapCenter(LatLng newCenter) {
    //   setState(() {
    //     _newCenter = newCenter;
    //   });

    // void _updateMapCenter(LatLng newCenter) {
    //   setState(() {
    //     centerCoordinate = newCenter;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    message(_matchRestaurant.name);
    message("new coordinate: $centerCoordinate");
    // Fluttertoast.showToast(msg: _matchRestaurant.name);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   title: const SearchBarTypeahead(),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              flex: isFiltersVisible ? 9 : 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Column(
                  children: [
                    // const SearchBarTypeahead(),
                    SearchSection(
                      isFilterVisible: isFiltersVisible,
                      onToggleFilter: () {
                        setState(() {
                          isFiltersVisible = !isFiltersVisible;
                        });
                      },
                      onSearch: (restaurant) {
                        setState(() {
                          _matchRestaurant = restaurant;
                        });
                      },
                    ),
                    Visibility(
                      visible: isFiltersVisible,
                      child: const PriceFilter(),
                    ),
                    SizedBox(
                      height: xsmall,
                    ),
                    Visibility(
                      visible: isFiltersVisible,
                      child: const CuisineTypeFilter(),
                    )
                  ],
                ),
              ),
            ),
            //! map and listview here
            Expanded(
              flex: 10,
              child: AnimatedCrossFade(
                firstChild: MapView(
                  restaurants: restaurants,
                  centerCoordinate: _matchRestaurant.location,
                ),
                secondChild: RestaurantListView(
                  restaurants: restaurants,
                ),
                duration: const Duration(seconds: 1),
                crossFadeState: isMapView
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: white,
        onPressed: () {
          setState(() {
            isMapView = !isMapView;
          });
        },
        child: isMapView ? const Icon(Icons.list) : const Icon(Icons.map),
      ),
    );
  }
}
