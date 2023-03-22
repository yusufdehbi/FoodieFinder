import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  @override
  Widget build(BuildContext context) {
    try {
      return FlutterMap(
        options: MapOptions(
          center: LatLng(34.0500322, -6.8127248),
          zoom: 20.0,
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.dehbideveloper.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(30, 40),
                width: 80,
                height: 80,
                builder: (context) => FlutterLogo(),
              ),
            ],
          ),
        ],
      );
    } catch (e) {
      print(e.toString());
      return Container();
    }
  }
}
