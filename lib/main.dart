import 'package:first_version/pages/favorite_restaurants_page.dart';
import 'package:first_version/pages/home_page.dart';
import 'package:first_version/pages/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const ResApp());
}

class ResApp extends StatefulWidget {
  const ResApp({super.key});

  @override
  State<ResApp> createState() => _ResAppState();
}

class _ResAppState extends State<ResApp> {
  int pageIndex = 1;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.white),
      home: SafeArea(
        child: Scaffold(
          body: pageIndex == 0
              ? ProfilePage(
                  changePage: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                )
              : pageIndex == 1
                  ? const HomePage()
                  : const FavoriteRestaurantsPage(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            currentIndex: pageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
