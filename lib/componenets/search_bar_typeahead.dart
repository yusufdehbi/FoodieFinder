import 'package:first_version/models/restaurant.dart';
import 'package:first_version/services/restaurants_service.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';

import '../pages/restaurant_page.dart';

class SearchBarTypeahead extends StatefulWidget {
  // final Function(Restaurant) parentData;
  final Function(Restaurant) onSearch;
  const SearchBarTypeahead({super.key, required this.onSearch});

  @override
  State<SearchBarTypeahead> createState() => _SearchBarTypeaheadState();
}

class _SearchBarTypeaheadState extends State<SearchBarTypeahead> {
  String? userSelected;
  Restaurant searchedRestaurant =
      Restaurant("none", "", LatLng(33.9715904, -6.8498129), 0, "", "", 1, "");

//! variavke sended
  Restaurant _searchQuery =
      Restaurant("none", "", LatLng(33.9715904, -6.8498129), 0, "", "", 1, "");

  // void _sendData() {
  //   widget.parentData.call(searchedRestaurant);
  // }
  void _sendData() {
    widget.onSearch(searchedRestaurant);
  }

//! function do the job
  void _handleSearchQueryChanged(Restaurant query) {
    setState(() {
      _searchQuery = query;
      _sendData();
    });
  }

  //! call callback function to send data back to Home Page widget
  // widget.onSearch(_searchQuery);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: TypeAheadField(
          //! if = No Item Find
          noItemsFoundBuilder: (context) => const SizedBox(
            height: 50,
            child: Center(
              child: Text('No Item Found'),
            ),
          ),
          //! if = Item Find Suggestion Box Decoration
          suggestionsBoxDecoration: const SuggestionsBoxDecoration(
            color: Colors.white,
            elevation: 4.0,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          //i don't think it's important
          debounceDuration: const Duration(milliseconds: 400),
          //! input field
          textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: "Search for a restaurant",
                contentPadding: const EdgeInsets.only(top: 4, left: 10),
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                suffixIcon: IconButton(
                    onPressed: () {},
                    splashColor: Colors.transparent,
                    icon: const Icon(Icons.search, color: Colors.grey)),
                fillColor: Colors.grey[100],
                filled: true),
          ),
          // responsible to return the value of suggestion
          suggestionsCallback: (value) {
            return RestaurantsService.getSuggestions(value);
          },
          //! Decoration of item in column
          itemBuilder: (context, String suggestion) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.refresh,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        suggestion,
                        maxLines: 1,
                        // style: TextStyle(color: Colors.red),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          onSuggestionSelected: (String suggestion) {
            setState(() {
              userSelected = suggestion;
              Restaurant matchRestaurant;
              for (var restaurant in RestaurantsService.restaurants) {
                if (restaurant.name.toLowerCase() ==
                    userSelected.toString().toLowerCase()) {
                  matchRestaurant = restaurant;
                  // Fluttertoast.showToast(
                  //     msg: "Search bar typeahead widget" +
                  //         matchRestaurant.toString());
                  searchedRestaurant = matchRestaurant;
                  _handleSearchQueryChanged(searchedRestaurant);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         RestaurantPage(restaurant: searchedRestaurant),
                  //   ),
                  // );
                  // widget.onSearch(matchRestaurant);
                }
              }
            });
          },
        ));
  }
}
