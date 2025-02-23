import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/data.dart/language.dart';
import 'package:realestate/provider/favorite_prvider.dart';

import 'package:realestate/screans/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> { 
  // int myCurrentIndex = 0;

  // void _selectedpage(int index) {
  //   setState(() {
  //     myCurrentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
    ChangeNotifierProvider(create:(_) => FavoritePrvider())

  ],
    child:  MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
      home: Welcome(),
    
    ));
  }

