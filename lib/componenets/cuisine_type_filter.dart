import 'package:first_version/models/cuisine_type_chip.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';

class CuisineTypeFilter extends StatefulWidget {
  const CuisineTypeFilter({super.key});

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
    'Moroccan',
    'Italy',
    'Chamy',
    'Fast Food',
    'Korean',
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
