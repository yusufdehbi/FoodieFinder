import 'dart:convert';
import 'dart:ui';

import 'package:first_version/icons/marker_icon_first.dart';
import 'package:first_version/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:http/http.dart' as http;

class MapView extends StatefulWidget {
  final LatLng start;
  // final LatLng end;
  final List<Restaurant> restaurants;
  // final LatLng centerCoordinate;
  final MapOptions mapOptions;
  const MapView({
    super.key,
    required this.restaurants,
    required this.mapOptions,
    required this.start,
    // required this.end,
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  List<LatLng> routpoints = [LatLng(52.05884, -1.345583)];
  Restaurant clickedRestaurant =
      Restaurant("", "", LatLng(33.9715904, -6.8498129), 0, "", "", 1, "");

  // LatLng start = LatLng(33.9665236, -6.8948313);
  // LatLng end = LatLng(33.97349488165066, -6.835152054664992);

  getRoutes(LatLng start, LatLng end) async {
    //getting the location in list i don't know why and using the first index from it.
    // List<Location> start_l =
    //     await locationFromAddress(start.text);
    // List<Location> end_l =
    //     await locationFromAddress(end.text);

    //share location data to 4 variable (double) each one have latitude or longitude
    // var v1 = start_l[0].latitude;
    // var v2 = start_l[0].longitude;
    // var v3 = end_l[0].latitude;
    // var v4 = end_l[0].longitude;

    //start latitude
    var v1 = start.latitude;
    //start longitude
    var v2 = start.longitude;
    //end latitude
    var v3 = end.latitude;
    //end longitude
    var v4 = end.longitude;

    // i think this is the one responsive of the routing
    //! get the url
    var url = Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson&overview=full');
    //! parse the response
    var response = await http.get(url);
    print(response.body);
    setState(() {
      routpoints = [];
      var ruter =
          jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
      for (int i = 0; i < ruter.length; i++) {
        var reep = ruter[i].toString();
        reep = reep.replaceAll("[", "");
        reep = reep.replaceAll("]", "");
        var lat1 = reep.split(',');
        var long1 = reep.split(",");
        routpoints.add(LatLng(double.parse(lat1[1]), double.parse(long1[0])));
      }
      //! show and hide the map
      print("here here" + routpoints.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // getRoutes(widget.start, widget.end);
    return FlutterMap(
      options: MapOptions(
        zoom: 14.0,
        center: LatLng(33.9715904, -6.8498129),
        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              'https://tile.thunderforest.com/atlas/{z}/{x}/{y}.png?apikey=c729f1b69fd24f8ea3e3c99785551dd5',
        ),
        MarkerLayerOptions(
          markers: widget.restaurants
              .map(
                (restaurant) => Marker(
                  // anchorPos: AnchorPos.align(AnchorAlign.top),
                  point: restaurant.location,
                  builder: (context) => GestureDetector(
                    onTap: () {
                      print(" clicked");
                    },
                    child: Icon(
                      MarkerIconFirst.filled,
                      // Icons.location_history_sharp,
                      color: Colors.orange[900],
                      size: 50.0,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        PolylineLayerOptions(polylineCulling: false, polylines: [
          Polyline(points: routpoints, color: Colors.blue, strokeWidth: 6),
        ])
      ],
    );
  }
}


/**
 * MapOptions(
        onPositionChanged: (position, _) {
          final newCenter = position.center;
        },
        zoom: 14.0,
        center: centerCoordinate,
        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
      ),
 */

/**
 * MarkerLayerOptions(
          markers: widget.restaurants
              .map(
                (restaurant) => Marker(
                  // anchorPos: AnchorPos.align(AnchorAlign.top),
                  point: restaurant.location,
                  builder: (context) => GestureDetector(
                    onTap: () {
                      print(" clicked");
                    },
                    child: Icon(
                      MarkerIconFirst.filled,
                      // Icons.location_history_sharp,
                      color: Colors.orange[900],
                      size: 100.0,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
 */