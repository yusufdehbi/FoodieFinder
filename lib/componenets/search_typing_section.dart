import 'package:first_version/models/restaurant.dart';
import 'package:first_version/services/restaurants_service.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:latlong2/latlong.dart';

class SearchTypingSection extends StatefulWidget {
  final Function(Restaurant) onSearch;
  const SearchTypingSection({super.key, required this.onSearch});

  @override
  State<SearchTypingSection> createState() => _SearchTypingSectionState();
}

class _SearchTypingSectionState extends State<SearchTypingSection> {
  String? userSelected;

  Restaurant _searchQuery =
      Restaurant("none", "", LatLng(33.9715904, -6.8498129), 0, "", "", 1, "");

  void _handleSearchQueryChanged(Restaurant query) {
    setState(() {
      _searchQuery = query;
    });
  }

  onSearch(_searchQuery) {
    // TODO: implement onSearch
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
