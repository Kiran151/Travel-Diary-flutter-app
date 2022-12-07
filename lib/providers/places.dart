import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/helper/db_helper.dart';
import 'package:myapp/models/place.dart';

class UserPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage, DateTime date) {
    final newPlace = Place(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: pickedTitle,
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  void delete(id) async {
    DBHelper.delete(id);
    notifyListeners();
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
            ))
        .toList();
    notifyListeners();
  }

  Place findById(String? id) {
    return _items.firstWhere((place) => place.id == id);
  }
}
