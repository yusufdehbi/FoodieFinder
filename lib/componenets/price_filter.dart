import 'package:flutter/material.dart';

class PriceFilter extends StatelessWidget {
  const PriceFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Price Range'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Chip(
                //avatar: Icon(Icons.attach_money),
                label: Text(r"$"),
              ),
              Chip(
                // avatar: Icon(Icons.location_city),
                label: Text(r"$$"),
              ),
              Chip(
                // avatar: Icon(Icons.filter),
                label: Text(r"$$$"),
              ),
              Chip(
                // avatar: Icon(Icons.filter_1),
                label: Text(r"$$$$"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
