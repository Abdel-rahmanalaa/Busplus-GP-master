import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';

class PassengerLastLocationScreen extends StatelessWidget {
  const PassengerLastLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Locations'),
      ),
      body: Column(
        children: [
        /*  const SizedBox(
            height: 70,
          ),*/
          /*const Padding(
            padding: EdgeInsets.only(left: 102, right: 102),
            child: Text(
              "Latest Locations",
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),*/
           const SizedBox(
            height: 50,
          ),
          Row(
            children: const [
              SizedBox(width: 35),
              Text(
                'Shubra',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          myDivider(),
          Row(
            children: const [
              SizedBox(width: 35),
              Text(
                'Mataria',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          myDivider(),
          Row(
            children: const [
              SizedBox(width: 35),
              Text(
                'Mzallat',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          myDivider(),
          Row(
            children: const [
              SizedBox(width: 35),
              Text(
                'Rod El Farag',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          myDivider(),
          Row(
            children: const [
              SizedBox(width: 35),
              Text(
                'Khalafawy',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          myDivider(),
          Row(
            children: const [
              SizedBox(width: 35),
              Text(
                'Kolyet Zeraa',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          myDivider(),
          Row(
            children: const [
              SizedBox(width: 35),
              Text(
                'St. Thresa',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          myDivider(),
          Row(
            children: const [
              SizedBox(width: 35),
              Text(
                'Mohamed Nugib',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          myDivider(),
          Row(
            children: const [
              SizedBox(width: 35),
              Text(
                'Sadat',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          /*const SizedBox(
            height: 110,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: InkWell(

              splashColor: Colors.teal,
              onTap: (){
                navigateBack(context, const NavigationDrawerWidget());
              },
              child: Image.asset("assets/images/Back.png",
                alignment: Alignment.bottomLeft,
                width: 70,
                height: 60,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}