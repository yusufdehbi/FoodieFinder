import 'package:first_version/pages/home_page.dart';
import 'package:first_version/pages/test_geolocator.dart';
import 'package:first_version/utilis/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ResApp());
}

class ResApp extends StatefulWidget {
  const ResApp({super.key});

  @override
  State<ResApp> createState() => _ResAppState();
}

class _ResAppState extends State<ResApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SafeArea(
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
