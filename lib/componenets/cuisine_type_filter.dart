import 'package:first_version/data/restaurants.dart';
import 'package:first_version/models/cuisine_type_chip.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';

class CuisineTypeFilter extends StatefulWidget {
  final Function onFilter;
  const CuisineTypeFilter({super.key, required this.onFilter});

  @override
  State<CuisineTypeFilter> createState() => _CuisineTypeFilterState();
}

class _CuisineTypeFilterState extends State<CuisineTypeFilter> {
  // List<CuisineTypeChip> cuisineTypeChips = [
  //   CuisineTypeChip("Moroccan", false),
  //   CuisineTypeChip("Italy", false),
  //   CuisineTypeChip("Chamy", false),
  //   CuisineTypeChip("Japanese", false),
  //   CuisineTypeChip("Korean", false),
  //   CuisineTypeChip("Chinese", false),
  // ];

  List<String> _selectedFilters = [];

  final List<String> _filters = [
    'Morrocan',
    'Fast Food',
    'Cham',
    'Fast Food',
    'Mix',
    'Chinese'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Cuisine Type',
            style: heading3,
          ),
          Wrap(
            spacing: 8.0,
            children: _filters.map((filter) {
              return FilterChip(
                label: Text(filter),
                backgroundColor: Colors.green.withOpacity(0.1),
                selected: _selectedFilters.contains(filter),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      _selectedFilters.add(filter);
                    } else {
                      _selectedFilters.removeWhere((String name) {
                        return name == filter;
                      });
                    }
                    RestaurantsData.cuisineTypeFiltered.clear();
                    RestaurantsData.restaurants.forEach((restaurant) {
                      _selectedFilters.forEach((cuisineType) {
                        if (restaurant.cuisineType == cuisineType) {
                          RestaurantsData.cuisineTypeFiltered.add(restaurant);
                        }
                      });
                    });
                    if (RestaurantsData.cuisineTypeFiltered.isEmpty) {
                      RestaurantsData.cuisineTypeFiltered =
                          RestaurantsData.restaurants;
                    }
                    widget.onFilter();
                  });
                },
                checkmarkColor: Colors.green,
                selectedColor: Colors.green.withOpacity(0.3),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
