import 'package:flutter/material.dart';

class DriverShareLocationScreen extends StatelessWidget {
  const DriverShareLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Share Screen'),
        //centerTitle: true,
      ),
      body: const Center(
        child: Text('Share location'),
      ),
    );
  }
}