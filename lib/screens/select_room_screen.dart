// imports the necessary packages
import 'package:flutter/material.dart';
import 'package:hotel_booking_flutter/screens/hotel_list_screen.dart';
import 'package:intl/intl.dart';

// class for a RoomSelectionScreen widget which extends the StatefulWidget class./
class RoomSelectionScreen extends StatefulWidget {
  // string variable to hold the selected address
  final String selectedAddress;

  // variable to hold the check-in and check-out date
  final DateTime checkInDate;
  final DateTime checkOutDate;

  RoomSelectionScreen(
      {super.key,
      required this.selectedAddress,
      required this.checkInDate,
      required this.checkOutDate});

  @override
  _RoomSelectionScreenState createState() => _RoomSelectionScreenState();
}

class _RoomSelectionScreenState extends State<RoomSelectionScreen> {
  // Creates a date format to be used
  final DateFormat formatter = DateFormat('MMM d, y');

  // nitializes a variable to store the number of selected rooms and sets its initial value to 1.
  int _selectedRooms = 1;

  // Initializes a variable to store the number of selected adults and sets its initial value to 1.
  int _selectedAdults = 1;

  // Initializes a variable to store the number of selected children and sets its initial value to 0.
  int _selectedChildren = 0;

  // Initializes a variable to store the number of selected infants and sets its initial value to 0.
  int _selectedInfants = 0;

  // This is a function called _incrementValue .
  // It uses a switch statement to increment the value of the corresponding variable
  void _incrementValue(String type) {
    setState(() {
      switch (type) {
        case 'Rooms':
          _selectedRooms++;
          break;
        case 'Adults':
          _selectedAdults++;
          break;
        case 'Children':
          _selectedChildren++;
          break;
        case 'Infants':
          _selectedInfants++;
          break;
      }
    });
  }

  // This is a function called _decrementValue .
  // It uses a switch statement to decrement the value of the corresponding variable
  void _decrementValue(String type) {
    setState(() {
      switch (type) {
        case 'Rooms':
          if (_selectedRooms > 1) _selectedRooms--;
          break;
        case 'Adults':
          if (_selectedAdults > 1) _selectedAdults--;
          break;
        case 'Children':
          if (_selectedChildren > 0) _selectedChildren--;
          break;
        case 'Infants':
          if (_selectedInfants > 0) _selectedInfants--;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add the number of Guests'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.selectedAddress,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Check In : ${formatter.format(widget.checkInDate)}',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Check Out : ${formatter.format(widget.checkOutDate)}',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Rooms',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      'Total room',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _decrementValue('Rooms'),
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 30,
                      ),
                    ),
                    Text(
                      '$_selectedRooms',
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () => _incrementValue('Rooms'),
                      icon: const Icon(Icons.add_circle_outline, size: 30),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Adults',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      'Age 13yr and above',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _decrementValue('Adults'),
                      icon: const Icon(Icons.remove_circle_outline, size: 30),
                    ),
                    Text(
                      '$_selectedAdults',
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () => _incrementValue('Adults'),
                      icon: const Icon(Icons.add_circle_outline, size: 30),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Children',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      'Age 2-12yr',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _decrementValue('Children'),
                      icon: const Icon(Icons.remove_circle_outline, size: 30),
                    ),
                    Text(
                      '$_selectedChildren',
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () => _incrementValue('Children'),
                      icon: const Icon(Icons.add_circle_outline, size: 30),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Infants',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      'under 2',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _decrementValue('Infants'),
                      icon: const Icon(Icons.remove_circle_outline, size: 30),
                    ),
                    Text(
                      '$_selectedInfants',
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () => _incrementValue('Infants'),
                      icon: const Icon(Icons.add_circle_outline, size: 30),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelList(
                          checkInDate: widget.checkInDate,
                          checkOutDate: widget.checkOutDate,
                          selectedRooms: _selectedRooms,
                          selectedAdults: _selectedAdults,
                          selectedChildren: _selectedChildren,
                          selectedInfants: _selectedInfants,
                          selectedAddress: widget.selectedAddress,
                        ),
                      ),
                    );
                  },
                  child: const Text('Search'),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
