import 'package:flutter/material.dart';

class PassengerHelpScreen extends StatelessWidget {
  const PassengerHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help'),),
        body: const Center(
          child: Text('Help'),
        )
    );
  }
}