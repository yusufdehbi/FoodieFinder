import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class Geolocator extends StatefulWidget {
  const Geolocator({super.key});

  @override
  State<Geolocator> createState() => _GeolocatorState();
}

class _GeolocatorState extends State<Geolocator> {
  String locationMessage = "Current location of user";

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
                Fluttertoast.showToast(msg: "hello world");
              },
              child: const Text("Get Current "),
            ),
          ],
        ),
      ),
    );
  }
}
