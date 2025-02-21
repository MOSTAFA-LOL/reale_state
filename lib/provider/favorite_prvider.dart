import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:realestate/data.dart/data2.dart';

class FavoritePrvider extends ChangeNotifier {
  final List<Home> _favorite = [];
  List<Home> get favorites => _favorite;
  void toggleFavoite(Home home) {
    if (_favorite.contains(home)) {
      _favorite.remove(home);
    } else {
      _favorite.add(home);
    }
    notifyListeners();
  }

  bool isExist(Home home) {
    final isExist = _favorite.contains(home);
    return isExist;
  }

  static FavoritePrvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoritePrvider>(context, listen: listen);
  }
  }
