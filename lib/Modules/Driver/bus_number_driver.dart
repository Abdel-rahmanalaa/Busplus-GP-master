import 'package:busplus/Layouts/Driver/main_driver.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';

class BusNumberScreen extends StatefulWidget {
  BusNumberScreen({Key? key}) : super(key: key);

  @override
  State<BusNumberScreen> createState() => _BusNumberScreenState();
}

class _BusNumberScreenState extends State<BusNumberScreen> {
  List <String> buses = [
    '108',
    '11',
    '112',
    '126',
    '14',
    '159',
    '19',
    '219',
    '265',
    '304',
    '60',
    '615',
    '616',
    '617',
    '66',
    '72' ,
    '83'
  ];

  String? busDropVal;
  void busDropChange(String? val){
    setState(() {
      busDropVal = val!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Your Bus No.',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonFormField<String>(
                value: busDropVal,
                onChanged: busDropChange,
                validator:  (value)
                {
                  if(value!.isEmpty)
                  {
                    return"bus number is Empty";
                  }
                  return '';
                },
                hint: const Text('Select Bus'),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Bus Number",
                  filled: true,
                ),
                items: buses.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
              ),
          ),
          const SizedBox(
            height: 50,
          ),

          defaultButton(
            function: (){
              navigateBack(context, MainDriverScreen());
            },
            text: "Go",
            width: 260,
            isUpperCase: false,
            backgroundColorBox: Colors.teal,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
