// imports the necessary packages
import 'package:flutter/material.dart';

// The code defines a stateless widget YourBooking, which displays a simple screen with an AppBar
// This widget can be used to display the user's bookings in an app.
class YourBooking extends StatelessWidget {
  const YourBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Bookings'),
      ),
      body: const Center(
        child: Text(
          'Your Bookings Screen',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
