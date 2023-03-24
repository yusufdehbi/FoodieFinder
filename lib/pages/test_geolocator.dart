import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Geolocator extends StatefulWidget {
  const Geolocator({super.key});

  @override
  State<Geolocator> createState() => _GeolocatorState();
}

class _GeolocatorState extends State<Geolocator> {
  String locationMessage = "Current location of user";

// void getLocation() async
// Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter user geolocator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              locationMessage,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                // _getCurrentLocation();
              },
              child: const Text("Get Current Location"),
            ),
          ],
        ),
      ),
    );
  }
}
