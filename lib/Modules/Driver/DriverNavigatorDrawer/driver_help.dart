import 'package:flutter/material.dart';

class DriverHelpScreen extends StatelessWidget {
  const DriverHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        //centerTitle: true,
      ),
        body: const Center(
          child: Text('Help'),
        )
    );
  }
}