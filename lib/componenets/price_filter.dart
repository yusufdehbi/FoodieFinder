import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  List<String> _selectedFilters = [];
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
