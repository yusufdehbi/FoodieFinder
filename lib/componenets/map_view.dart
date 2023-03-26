import 'package:first_version/icons/marker_icon_first.dart';
import 'package:first_version/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';

class MapView extends StatelessWidget {
  final List<Restaurant> restaurants;
  final LatLng centerCoordinate;
  const MapView(
      {super.key, required this.restaurants, required this.centerCoordinate});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        zoom: 14.0,
        center: centerCoordinate,
        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              'https://tile.thunderforest.com/atlas/{z}/{x}/{y}.png?apikey=c729f1b69fd24f8ea3e3c99785551dd5',
        ),
        MarkerLayerOptions(
          markers: restaurants
              .map(
                (restaurant) => Marker(
                  anchorPos: AnchorPos.align(AnchorAlign.top),
                  point: restaurant.location,
                  builder: (context) => IconButton(
                    onPressed: () {
                      print(restaurant.name + " clicked");
                    },
                    icon: Icon(
                      MarkerIconFirst.filled,
                      color: Colors.orange[900],
                      size: 50.0,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
