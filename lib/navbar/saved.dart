import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/data.dart/data.dart';
import 'package:realestate/provider/favorite_prvider.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoritePrvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favorite',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: finalList.length,
                  itemBuilder: (context, index) {
                    final favoriteItem = finalList[index];
                    return Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  width: 88,
                                  height: 88,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                      child: Image.asset(favoriteItem.image),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  })),
        ],
      ),
    );
  }
}
