import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/data.dart/data.dart';
// import 'package:provider/provider.dart';


class FavoritePrvider extends ChangeNotifier {
  final List<House> _favorite = [];
  List<House> get favorites => _favorite;
  void toggleFavoite(House house) {
    if (_favorite.contains(house)) {
      _favorite.remove(house);
    } else {
      _favorite.add(house);
    }
    notifyListeners();
  }

  bool isExist(House house) {
    final isExist = _favorite.contains(house);
    return isExist;
  }

  static FavoritePrvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoritePrvider>(context, listen: listen);
  }
  }
