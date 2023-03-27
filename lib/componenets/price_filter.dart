import 'package:first_version/data/restaurants.dart';
import 'package:first_version/models/restaurant.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PriceFilter extends StatefulWidget {
  final Function onFilter;
  const PriceFilter({super.key, required this.onFilter});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  List<String> _selectedFilters = [];
  List<Restaurant> filtredRestaurants = [];
  final List<String> _filters = [
    r'$',
    r'$$',
    r'$$$',
    r'$$$$',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Range',
            style: heading3,
          ),
          Center(
            child: Wrap(
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
                      //code go here
                      filtredRestaurants.clear();
                      RestaurantsData.restaurants.forEach(
                        (restaurant) {
                          _selectedFilters.forEach((element) {
                            if (restaurant.priceRange == element.length) {
                              filtredRestaurants.add(restaurant);
                            }
                          });
                        },
                      );
                      RestaurantsData.priceFiltered = filtredRestaurants;
                      if (_selectedFilters.length == 0) {
                        RestaurantsData.priceFiltered =
                            RestaurantsData.restaurants;
                      }
                      if (_selectedFilters.isEmpty) {
                        widget.onFilter(RestaurantsData.restaurants);
                      } else {
                        widget.onFilter(filtredRestaurants);
                      }
                      // RestaurantsData.priceFiltered.forEach((restaurant) {
                      //   Fluttertoast.showToast(
                      //       msg: "${restaurant.name} from data");
                      // });
                      print("price filtered: " +
                          RestaurantsData.priceFiltered.toString());
                    });
                  },
                  checkmarkColor: Colors.green,
                  selectedColor: Colors.green.withOpacity(0.3),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
