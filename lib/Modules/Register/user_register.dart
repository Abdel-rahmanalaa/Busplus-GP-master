import 'package:busplus/Modules/Register/PassengerRegister/passenger_vision.dart';
import 'package:busplus/Modules/Register/DriverRegister/driver_phone.dart';
import 'package:busplus/Modules/Login/login_screen.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          const SizedBox(
            height: 270,
          ),
          const Text(
            'How would you like to use the App ?',
            style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              InkWell(
                splashColor: Colors.teal,
                onTap: ()
                {
                  navigateTo(context, PhoneDriverScreen());
                },
                child: Image.asset("assets/images/Driver.png",
                  width: 170,
                  height: 170,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                splashColor: Colors.teal,
                onTap: ()
                {
                  navigateTo(context, BLindDialogScreen());
                },
                child : Image.asset("assets/images/Pass.png",
                width: 170,
                height: 170,
              ),
              )
            ],
          ),
          const SizedBox(
            height: 205,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: InkWell(
              splashColor: Colors.teal,
              onTap: (){
                navigateBack(context, LoginScreen());
              },
              child: Image.asset("assets/images/Back.png",
                alignment: Alignment.bottomLeft,
                width: 70,
                height: 60,
              ),
            ),
          ),
        ]
      ),
    );
  }
}
