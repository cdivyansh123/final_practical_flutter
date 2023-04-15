// imports the necessary packages
import 'package:flutter/material.dart';
import 'package:hotel_booking_flutter/screens/inbox_screen.dart';
import 'package:hotel_booking_flutter/screens/login_screen.dart';
import 'package:hotel_booking_flutter/screens/search_screen.dart';
import 'package:hotel_booking_flutter/screens/share_earn_screen.dart';
import 'package:hotel_booking_flutter/screens/your_bookings.dart';

// class HomeScreen extends the StatelessWidget class
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sets the title of the AppBar
      appBar: AppBar(
        title: const Text('HoldInn'),
      ),
      body: Column(
        children: [
          // creates a search bar
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Container(
              width: 350,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextField(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.orange,
                      size: 35,
                    ),
                    hintText: 'Search by city, landmark, or hotel',
                    hintStyle: TextStyle(fontSize: 18),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          // creates a ListView widget that contains two instances of the SectionList widget, each with a different set of hotels
          const SizedBox(
            height: 22,
          ),
          Expanded(
            child: ListView(
              children: [
                SectionList(
                  title: 'Top Deals',
                  hotels: [
                    Hotel(
                      name: 'The Stanley Hotel',
                      price: 'SR 345.00',
                      image: const AssetImage('assets/images/hotel_1.jpg'),
                    ),
                    Hotel(
                      name: 'Regency Hotel',
                      price: 'SR 340.00',
                      image: const AssetImage('assets/images/hotel_2.png'),
                    ),
                    Hotel(
                      name: 'Mandarin Oriental',
                      price: 'SR 240.00',
                      image: const AssetImage('assets/images/hotel_3.png'),
                    ),
                    Hotel(
                      name: 'Clarion Hotel and Casino',
                      price: 'SR 500.00',
                      image: const AssetImage('assets/images/hotel_4.png'),
                    ),
                    Hotel(
                      name: 'Hotel Bond',
                      price: 'SR 345.00',
                      image: const AssetImage('assets/images/hotel_5.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 21,
                ),
                SectionList(
                  title: 'Recent Booking',
                  hotels: [
                    Hotel(
                      name: 'Gokulam Grand Turtle',
                      price: 'SR 500.00',
                      image: const AssetImage('assets/images/hotel_6.jpeg'),
                    ),
                    Hotel(
                      name: 'Seven Seas Hotel',
                      price: 'SR 345.00',
                      image: const AssetImage('assets/images/hotel_7.jpeg'),
                    ),
                    Hotel(
                      name: 'The Central Park Hotel',
                      price: 'SR 600.00',
                      image: const AssetImage('assets/images/hotel_5.png'),
                    ),
                    Hotel(
                      name: 'Chandys Windy Woods',
                      price: 'SR 425.00',
                      image: const AssetImage('assets/images/hotel_4.png'),
                    ),
                    Hotel(
                      name: 'Roseate House',
                      price: 'SR 200.00',
                      image: const AssetImage('assets/images/hotel_2.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      //creates s bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    //todo
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.orange,
                  ),
                ),
                const Text("Search")
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.account_circle_outlined),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                ),
                const Text("Profile")
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.view_list_outlined),
                  onPressed: () {
                    //todo
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const YourBooking()));
                  },
                ),
                const Text("My Bookings")
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.inbox),
                  onPressed: () {
                    //todo
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Inbox()));
                  },
                ),
                const Text("Inbox")
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.share_rounded),
                  onPressed: () {
                    //todo
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShareAndEarn()));
                  },
                ),
                const Text("Share & Earn")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// This is a SectionList class that extends StatelessWidget
class SectionList extends StatelessWidget {
  final String title;
  final List<Hotel> hotels;

  const SectionList({super.key, required this.title, required this.hotels});

  @override
  Widget build(BuildContext context) {
    // Return a Column widget that displays a list of hotels
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display the title of the section
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),

        // Display the list of hotels in a horizontal ListView
        SizedBox(
          height: 260,
          width: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Card(
                    elevation: 2,
                    color: Colors.grey.shade300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image(
                              image: hotels[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 11.0),

                          // Display the hotel name
                          Text(
                            hotels[index].name,
                            style: const TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 11.0),
                          Text(
                            hotels[index].price,
                            style: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// This is a class called Hotel. It has three properties:
// name - a required String that represents the name of the hotel.
// price - a required String that represents the price of the hotel.
// image - a required AssetImage that represents the image of the hotel.
class Hotel {
  final String name;
  final String price;
  final AssetImage image;

  Hotel({required this.name, required this.price, required this.image});
}
