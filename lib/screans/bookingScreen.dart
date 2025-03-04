// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:realestate/data.dart/data.dart';
import 'package:realestate/provider/book_provider.dart';
import 'package:realestate/screans/sign_up.dart';

class BookingsScreen extends StatelessWidget {
  final House house;
  const BookingsScreen({
    super.key,
    required this.house,
  });
  

  @override
  Widget build(BuildContext context) {
    final bookProvider = context.read<BookProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Property: ${house.name}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const Text('Enter Booking Details:', style: TextStyle(fontSize: 18)),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                bookProvider.bookHouse(house);
                Navigator.pop(context);
                _showBookingConfirmation(context);
              },
              child: const Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
  void _showBookingConfirmation(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        'Booking confirmed successfully!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.green.shade600,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
    ),
  );
}
}
