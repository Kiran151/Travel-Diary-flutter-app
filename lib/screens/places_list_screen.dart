import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/helper/db_helper.dart';
import 'package:myapp/providers/places.dart';
import 'package:myapp/screens/add_place_screen.dart';
import 'package:myapp/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).primaryColor,
        //   title: const Text('Travel Diary'),
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
        //       },
        //       icon: Icon(Icons.add),
        //     ),
        //   ],
        // ),
        body: FutureBuilder(
      future:
          Provider.of<UserPlaces>(context, listen: false).fetchAndSetPlaces(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<UserPlaces>(
                  child: Center(
                    child: Text('no places added yet'),
                  ),
                  builder: (context, userPlaces, ch) => userPlaces.items.isEmpty
                      ? ch!
                      : ListView.builder(
                          itemCount: userPlaces.items.length,
                          itemBuilder: (ctx, i) => Slidable(
                            key: ValueKey(userPlaces.items[i].id),
                            startActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (ctx) {
                                    userPlaces.delete(userPlaces.items[i].id);
                                  },
                                  icon: Icons.delete,
                                  label: 'Delete',
                                )
                              ],
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    FileImage(userPlaces.items[i].image),
                              ),
                              title: Text(userPlaces.items[i].title),
                              trailing: IconButton(
                                  onPressed: () {
                                    userPlaces.delete(userPlaces.items[i].id);
                                  },
                                  icon: Icon(Icons.delete)),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    PlaceDetailScreen.routeName,
                                    arguments: userPlaces.items[i].id);
                              },
                            ),
                          ),
                        ),
                ),
    ));
  }
}
