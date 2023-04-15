// imports the necessary packages
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hotel_booking_flutter/screens/select_date_screen.dart';

// This is a Flutter widget class called SearchScreen that extends StatefulWidget
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  // createState() method to return a new instance of _SearchScreenState
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Text editing controller for the phone number input field
  var addresscontroller = TextEditingController();

  // code declares three variables - location, Address, and locations.
  String location = 'Null, Press Button';
  String Address = '';
  List<String> locations = [];

  // This function is responsible for getting the current device's position using the Geolocator library.
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // retrieves an address from a given latitude and longitude position.
  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = ' ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // code defines the app bar widget for a screen
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // This code creates a search bar
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
                            builder: (context) => SelectDate(
                                  selectedAddress: Address,
                                )));
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search by city, landmark, or hotel',
                    hintStyle: TextStyle(fontSize: 18),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          // The code creates a TextButton widget, which is used to get the device's current location.
          Padding(
            padding: const EdgeInsets.only(right: 170),
            child: TextButton.icon(
              onPressed: () async {
                Position position = await _getGeoLocationPosition();
                String location =
                    'Lat: ${position.latitude}, Long: ${position.longitude}';
                GetAddressFromLatLong(position);
                setState(() {
                  locations.add(location);
                });
              },
              icon: const Icon(Icons.gps_fixed),
              label: const Text(
                'Property Near me',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SelectDate(selectedAddress: Address)));
              },
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      Address,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.indigo),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
