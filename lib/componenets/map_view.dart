import 'package:first_version/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';

class MapView extends StatelessWidget {
  final List<Restaurant> restaurants;
  const MapView({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        zoom: 14.0,
        center: LatLng(34.0500322, -6.8127248),
        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        MarkerLayerOptions(
          markers: restaurants
              .map(
                (restaurant) => Marker(
                  point: restaurant.location,
                  builder: (context) => IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.restaurant,
                        color: Colors.green, size: 40.0),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
