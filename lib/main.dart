// imports the necessary packages
import 'package:flutter/material.dart';
import 'package:hotel_booking_flutter/screens/login_screen.dart';

// This function is the entry point for the application
void main() {
  // runs the MyApp widget as the root of the application
  runApp(const MyApp());
}

// This is the MyApp widget, which is a stateless widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // method builds the UI for the MyApp widget.
  @override
  Widget build(BuildContext context) {
    // method returns a MaterialApp widget that defines the theme and home screen for the application.
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const LoginScreen());
  }
}
