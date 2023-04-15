// code imports the necessary packages
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_flutter/screens/home_screen.dart';
import '../data/local/db/app_db.dart';
import 'package:drift/drift.dart' as drift;

// class for a LoginScreen widget which extends the StatefulWidget class.
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // returns an instance of the _LoginScreenState class
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// This is the stateful widget class for the login screen
class _LoginScreenState extends State<LoginScreen> {
  // Regular expression pattern to validate phone numbers
  Pattern pattern = r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';

  // Global key for the form widget
  final formkey = GlobalKey<FormState>();

  // Instance of the Appdb class to perform database operations
  late Appdb db;

  // Text editing controller for the phone number input field
  TextEditingController numbercontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the database instance
    db = Appdb();
  }

  @override
  Widget build(BuildContext context) {
    // Build and return the login screen widget tree
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Welcome to HoldInn'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/hotel_logo.png',
                  width: 100,
                ),
                const Text(
                  "Welcome to HoldInn",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Row(
                          children: const [
                            Expanded(
                              child: CountryCodePicker(
                                initialSelection: 'IN',
                                padding: EdgeInsets.only(right: 250),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                            ),
                          ],
                        ),
                      ),

                      // Text input field for phone number
                      TextFormField(
                          controller: numbercontroller,
                          decoration: const InputDecoration(
                              hintText: "Phone Number",
                              border: OutlineInputBorder()),
                          onChanged: (value) {
                            formkey.currentState?.validate();
                          },
                          keyboardType: TextInputType.number,

                          // Validator to check if phone number is valid
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter a number";
                            } else if (!RegExp(
                                    r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                .hasMatch(value)) {
                              return "please enter a valid number";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "We'll call or test to confirm your number.Standard message and data rates apply.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text:
                                  "By signing in to this app, you agree to the HoldInn ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "Terms & Conditions ",
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(
                              text: "and acknowledge the ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: Colors.blue)),
                        ]),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                SizedBox(
                  width: 370,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        addUser();
                        // print(numbercontroller.text);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }
                    },
                    child: const Text('Continue'),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: TextButton(
                      onPressed: () {
                        //todo
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        height: 1,
                        color: Colors.grey,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 1,
                        color: Colors.grey,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      // todo
                    },
                    child: const Text(
                      'show more options',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // This code defines a function addUser() that inserts user data into a database using db.insertUser() method.
  void addUser() {
    final isvalid = formkey.currentState?.validate();
    if (isvalid != null && isvalid) {
      final entity = UsersCompanion(
        number: drift.Value(numbercontroller.text),
      );
      db.insertUser(entity).then((value) => ScaffoldMessenger.of(context));
    }
  }
}
