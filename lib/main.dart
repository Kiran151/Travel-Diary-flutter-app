import 'package:flutter/material.dart';
import 'package:myapp/providers/places.dart';
import 'package:myapp/screens/add_place_screen.dart';
import 'package:myapp/screens/place_detail_screen.dart';
import 'package:myapp/screens/places_list_screen.dart';
import 'package:myapp/widgets/tab_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel Diary',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Tabbar(),
        routes: {
          AddPlaceScreen.routeName: (context) => AddPlaceScreen(),
          PlaceDetailScreen.routeName: (context) => PlaceDetailScreen()
        },
      ),
    );
  }
}
