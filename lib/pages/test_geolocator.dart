import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class TestGeolocator extends StatefulWidget {
  const TestGeolocator({super.key});

  @override
  State<TestGeolocator> createState() => _TestGeolocatorState();
}

class _TestGeolocatorState extends State<TestGeolocator> {
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _getLocation();
  }

  void _getLocation() async {
    try {
      _locationData = await location.getLocation();
      setState(() {});
    } catch (e) {
      print('Could not get the user\'s location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: _locationData != null
              ? LatLng(34.0531, -6.79846)
              : LatLng(_locationData!.latitude!, _locationData!.longitude!),
          zoom: 15,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          if (_locationData != null)
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80,
                  height: 80,
                  point: LatLng(_locationData!.latitude ?? 33.986977,
                      _locationData!.longitude ?? -6.854890),
                  builder: (ctx) =>
                      const Icon(Icons.location_on, color: Colors.red),
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getLocation,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
