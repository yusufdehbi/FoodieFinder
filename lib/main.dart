import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'home_page.dart';
import 'map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Search for a restaurant"),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: AppSearchDelegate(),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.redAccent,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'Search Bar here',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
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
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: MyMap(),
                ),
              ),
            ],
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.list),
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite'
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }


}

class AppSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'yamali cham',
    'MacDonald',
    'KFC',
    'Bahja food',
    'Dar Fawakih',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for(var inputQuery in searchTerms){
      if(inputQuery.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(inputQuery);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
        itemBuilder: (context, index){
        var result  = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for(var inputQuery in searchTerms){
      if(inputQuery.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(inputQuery);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
          var result  = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }



}


