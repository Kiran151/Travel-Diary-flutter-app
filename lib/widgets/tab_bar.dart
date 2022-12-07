import 'package:flutter/material.dart';
import 'package:myapp/screens/add_place_screen.dart';
import 'package:myapp/screens/places_list_screen.dart';
import 'package:myapp/widgets/drawer.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Travel Diary'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ],
            bottom: const TabBar(tabs: [
              Tab(
                text: 'home',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Add',
                icon: Icon(Icons.add_a_photo),
              ),
            ]),
          ),
          // drawer: Drawers(),
          body: TabBarView(children: [PlacesListScreen(), AddPlaceScreen()]),
        ),
      ),
    );
  }
}
