// imports the necessary packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// defines a StatefulWidget called HotelList
// constructor takes several required parameters
class HotelList extends StatefulWidget {
  final int selectedRooms;
  final int selectedAdults;
  final int selectedChildren;
  final int selectedInfants;
  final String selectedAddress;
  final DateTime checkInDate;
  final DateTime checkOutDate;

  const HotelList(
      {Key? key,
      required this.selectedAddress,
      required this.selectedRooms,
      required this.selectedAdults,
      required this.selectedChildren,
      required this.selectedInfants,
      required this.checkInDate,
      required this.checkOutDate})
      : super(key: key);

  @override
  State<HotelList> createState() => _HotelListState();
}

// defines a private class that extends the State
class _HotelListState extends State<HotelList> {
  // creates a new DateFormat object called formatter that formats dates as day-of-the-month
  final DateFormat formatter = DateFormat('d MMM');

  // build the widget tree when the state of the widget changes.
  @override
  Widget build(BuildContext context) {
    // This block of code sets up the app bar for the scaffold.
    // It includes a title that displays the selected address and the check-in and check-out dates in the specified format.
    // It also includes icons for the number of adults and rooms selected.
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.selectedAddress,
              style: const TextStyle(fontSize: 17),
            ),
            Row(
              children: [
                Text(
                  '${formatter.format(widget.checkInDate)} - ${formatter.format(widget.checkOutDate)}',
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  width: 14,
                ),
                const Icon(Icons.person),
                Text(widget.selectedAdults.toString()),
                const SizedBox(
                  width: 14,
                ),
                const Icon(Icons.key),
                Text(widget.selectedRooms.toString())
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(), // add this line
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // add this line
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              "assets/images/hotel_7.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Row(
                                  children: const [
                                    Text(
                                      'Four Points By Sheraton',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 35,
                                    ),
                                    Text(
                                      '3rd class',
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Opposite Gujarat College, Ellis Bridge',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                            text: "1 night stay: ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17)),
                                        TextSpan(
                                            text: "SR 111.00\n ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                        TextSpan(
                                            text: "+SR 19.4 taxes and charges ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(), // add this line
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // add this line
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              "assets/images/hotel_5.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Row(
                                  children: const [
                                    Text(
                                      'Four Points By Sheraton',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 35,
                                    ),
                                    Text(
                                      '3rd class',
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Opposite Gujarat College, Ellis Bridge',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                            text: "1 night stay: ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17)),
                                        TextSpan(
                                            text: "SR 111.00\n ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                        TextSpan(
                                            text: "+SR 19.4 taxes and charges ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120,
                  height: 80,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          //todo
                        },
                        icon: const Icon(Icons.sort),
                      ),
                      const Text(
                        "Sort",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const VerticalDivider(
                  thickness: 1,
                ),
                SizedBox(
                  width: 120,
                  height: 80,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          //todo
                        },
                        icon: const Icon(Icons.filter_alt),
                      ),
                      const Text(
                        "Filter",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const VerticalDivider(
                  thickness: 1,
                ),
                SizedBox(
                  width: 120,
                  height: 80,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          //todo
                        },
                        icon: const Icon(Icons.map_outlined),
                      ),
                      const Text(
                        "Map",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
