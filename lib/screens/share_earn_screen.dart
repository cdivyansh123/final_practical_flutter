// imports the necessary packages
import 'package:flutter/material.dart';

// stateless widget that displays the ShareAndEarn screen.
// It has an app bar and a body with a centered Text widget
class ShareAndEarn extends StatelessWidget {
  const ShareAndEarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ShareAndEarn'),
      ),
      body: const Center(
        child: Text(
          'ShareAndEarn Screen',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
