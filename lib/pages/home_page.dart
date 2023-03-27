import 'package:first_version/componenets/cuisine_type_filter.dart';
import 'package:first_version/componenets/map_view.dart';
import 'package:first_version/componenets/search_bar_typeahead.dart';
import 'package:first_version/pages/restaurant_page.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

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

  MapOptions mapOptions() {
    return MapOptions(
      zoom: 14.0,
      center: _matchRestaurant.location,
      interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
    );
  }

  void message(String str) {
    Fluttertoast.showToast(
      msg: "Home  : $str",
    );
  }

  //!variable for getting user location
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _getLocation();
  }

  void _getLocation() async {
    try {
      _locationData = await location.getLocation();
      setState(() {});
    } catch (e) {
      print('Could not get the user\'s location: $e');
    }
  }
  //!End of getting location stuff

  @override
  Widget build(BuildContext context) {
    // message("restaurant coordinate: ${_matchRestaurant.location}");
    // message("center coordinate: $centerCoordinate");
    message(_locationData.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      //!here where the HomePage() get the MatchRestaurant
                      onSearch: (restaurant) {
                        setState(() {
                          _matchRestaurant = restaurant;
                          centerCoordinate = _matchRestaurant.location;
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
                //! map view
                firstChild: MapView(
                  restaurants: restaurants,
                  // centerCoordinate: centerCoordinate,
                  mapOptions: mapOptions(),
                  start: LatLng(33.97349488165066, -6.835152054664992),
                ),
                //! list view
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
            _getLocation();
          });
        },
        child: isMapView ? const Icon(Icons.list) : const Icon(Icons.map),
      ),
    );
  }
}
