import 'package:first_version/data/restaurants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_version/componenets/search_bar_typeahead.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../models/restaurant.dart';

class SearchSection extends StatefulWidget {
  // final Function(Restaurant) parentData;
  final Function(Restaurant) onSearch;
  final bool isFilterVisible;
  final Function() onToggleFilter;

  const SearchSection({
    super.key,
    required this.isFilterVisible,
    required this.onToggleFilter,
    required this.onSearch,
  });

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  Restaurant _matchRestaurant =
      Restaurant("", "", LatLng(33.9715904, -6.8498129), 0, "", "", 1, "");
  Restaurant _gettedRestaurant =
      Restaurant("", "", LatLng(33.9715904, -6.8498129), 0, "", "", 1, "");

  Restaurant _searchQuery =
      Restaurant("", "", LatLng(33.9715904, -6.8498129), 0, "", "", 1, "");

  // void _sendData() {
  //   widget.parentData.call(_gettedRestaurant);
  // }

  void showTestMessage(String str) {
    Fluttertoast.showToast(
      msg: "Message : $str",
    );
  }

  @override
  Widget build(BuildContext context) {
    // showTestMessage(_matchRestaurant.name);
    return Row(
      children: [
        //! send the function to the child from the parent
        Expanded(
          child: SearchBarTypeahead(
            onSearch: widget.onSearch,
          ),
          // TextField(
          //   cursorColor: accent,
          //   style: p1,
          //   decoration: InputDecoration(
          //     prefixIcon: Icon(Icons.search, size: 22, color: text),
          //     hintText: 'Search Restaurant',
          //     hintStyle: p1,
          //     fillColor: Colors.grey[100],
          //     filled: true,
          //     contentPadding: EdgeInsets.symmetric(vertical: small),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       borderSide: BorderSide.none,
          //     ),
          //   ),
          // ),
        ),
        SizedBox(width: small),
        Container(
          decoration: BoxDecoration(
            color: accent,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 50,
          width: 50,
          // child: Icon(Icons.swap_horiz, color: white),
          child: IconButton(
            icon: widget.isFilterVisible
                ? Icon(Icons.arrow_upward, color: white)
                : Icon(
                    Icons.swap_horiz,
                    color: white,
                  ),
            onPressed: () {
              widget.onToggleFilter();
            },
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    // _sendData();
    super.initState();
  }
}
