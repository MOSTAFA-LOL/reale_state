import 'package:flutter/material.dart';

import 'package:realestate/data/data.dart';
// import 'package:provider/provider.dart';


class BookProvider extends ChangeNotifier {
  final List<House> _bookedHouses = [];

  List<House> get bookedHouses => _bookedHouses;

  void bookHouse(House house) {
    _bookedHouses.add(house);
    notifyListeners();
  }

  void cancelBooking(House house) {
    _bookedHouses.remove(house);
    notifyListeners();
  }

  static of(BuildContext context) {}
}