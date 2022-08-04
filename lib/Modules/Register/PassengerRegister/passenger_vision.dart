import 'package:busplus/Modules/Register/PassengerRegister/PassengerRegisterCubit/passenger_register_cubit.dart';
import 'package:busplus/Modules/Register/PassengerRegister/PassengerRegisterCubit/passenger_register_states.dart';
import 'package:busplus/Modules/Register/PassengerRegister/passenger_phone.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Shared/Components/constants.dart';

class BLindDialogScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PassengerRegisterCubit, PassengerRegisterStates>(
      listener: (context,state){},
      builder: (context, state){
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 180,
                  height: 170,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Text(
                  "Do you have any vision Difficulties?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15
                ),
                child: Text(
                  'If yes tap on the right side of the screen, if no tap on the left side',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: SizedBox(
            height: 360,
            width: double.infinity,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: defaultButton(
                          function: (){
                            isBlind = false;
                            navigateTo(
                              context,
                              PhonePassengerScreen(),
                            );
                          },
                          text: 'No',
                          isUpperCase: false,
                          textColor: Colors.teal,
                          height: 350,
                          width: 185,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: defaultButton(
                          function: (){
                            isBlind = true;
                            navigateTo(context,
                              PhonePassengerScreen(),
                            );
                          },
                          text: 'Yes',
                          isUpperCase: false,
                          textColor: Colors.teal,
                          height: 350,
                          width: 185,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

