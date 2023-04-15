// imports the necessary packages
import 'package:flutter/material.dart';
import 'package:hotel_booking_flutter/screens/select_room_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

// This is a SelectDate class that extends the StatefulWidget class
class SelectDate extends StatefulWidget {
  final String selectedAddress;

  const SelectDate({super.key, required this.selectedAddress});

  @override
  State<SelectDate> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SelectDate> {
  // This variable is used to store the selected check-in and check-out dates
  DateTime? checkInDate;
  DateTime? checkOutDate;

  // variable is used to create a date format
  final DateFormat formatter = DateFormat('MMM d, y');

  @override
  Widget build(BuildContext context) {
    bool isDateSelected = checkInDate != null && checkOutDate != null;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('When will you be there')),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.selectedAddress,
                style: const TextStyle(
                    fontSize: 21,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TableCalendar(
              selectedDayPredicate: (day) {
                return isSameDay(checkInDate, day) ||
                    isSameDay(checkOutDate, day);
              },
              enabledDayPredicate: (day) {
                return day
                    .isAfter(DateTime.now().subtract(const Duration(days: 1)));
              },
              onDaySelected: (selectedDay, _) {
                setState(() {
                  if (checkInDate == selectedDay) {
                    // toggle off the currently
                    // date
                    checkInDate = null;
                    checkOutDate = null;
                  } else if (checkInDate == null ||
                      checkOutDate != null ||
                      selectedDay.isBefore(checkInDate!)) {
                    // select as check-in date
                    checkInDate = selectedDay;
                    checkOutDate = null;
                  } else {
                    // select as check-out date
                    checkOutDate = selectedDay;
                  }
                });
              },
              focusedDay: DateTime.now(),
              firstDay: DateTime(DateTime.now().year, DateTime.now().month),
              lastDay: DateTime(DateTime.now().year + 1, DateTime.now().month),
              headerStyle: const HeaderStyle(formatButtonVisible: false),
            ),
            const SizedBox(
              height: 21,
            ),
            if (isDateSelected)
              Text(
                'Check In : ${formatter.format(checkInDate!)} \nCheck Out : ${formatter.format(checkOutDate!)}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
            if (!isDateSelected)
              const Text(
                'Please select check-in and check-out dates',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 370,
              height: 60,
              child: ElevatedButton(
                onPressed: isDateSelected
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RoomSelectionScreen(
                                      checkInDate: checkInDate!,
                                      checkOutDate: checkOutDate!,
                                      selectedAddress: widget.selectedAddress,
                                    )));
                        //todo
                      }
                    : null,
                child: const Text('Next'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
