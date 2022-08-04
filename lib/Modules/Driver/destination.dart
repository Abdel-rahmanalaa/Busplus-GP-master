import 'package:busplus/Layouts/Driver/main_driver.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {


  @override
  Widget build(BuildContext context) {
    var destinationController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Your Destination',
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
            child: defaultFormField(
              controller: destinationController,
              type: TextInputType.streetAddress,
              validate: (value)
              {
                if(value!.isEmpty)
                {
                  return"destination is wrong";
                }
              },
              label: "Enter Destination",
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