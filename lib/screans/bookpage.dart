import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/provider/book_provider.dart';

class Bookpage extends StatelessWidget {
  const Bookpage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookProvider = context.watch<BookProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('My Bookings')),
      body: ListView.builder(
        itemCount: bookProvider.bookedHouses.length,
        itemBuilder: (context, index) {
          final house = bookProvider.bookedHouses[index];
          return Column(
            children: [
              
              ListTile(
                title: Text(house.name),
                subtitle: Text(house.price),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => bookProvider.cancelBooking(house),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}