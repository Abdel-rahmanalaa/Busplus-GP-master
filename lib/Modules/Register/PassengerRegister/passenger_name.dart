import 'package:busplus/Modules/Register/PassengerRegister/passenger_email.dart';
import 'package:busplus/Modules/Register/PassengerRegister/passenger_password.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:busplus/Shared/Components/constants.dart';

class NamePassengerScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


  return Scaffold(
          body: SingleChildScrollView(
            child:
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  const SizedBox(
                    height: 380,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      defaultFormField(
                          controller: passengerFirstNameController,
                          type: TextInputType.name,
                          validate: (value) {
                            return validate(value!, 'name');
                          },
                          label: "First Name",
                          prefix: Icons.person),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                          controller: passengerLastNameController,
                          type: TextInputType.name,
                          validate: (value) {
                            return validate(value!, 'name');
                          },
                          label: "Last Name",
                          prefix: Icons.person),
                    ],
                  ),
                  ),
                  const SizedBox(
                    height: 170,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        InkWell(
                          splashColor: Colors.teal,
                          onTap: (){
                            navigateBack(context, EmailPassengerScreen());
                          },
                          child: Image.asset("assets/images/Back.png",
                            alignment: Alignment.bottomLeft,
                            width: 70,
                            height: 60,
                          ),
                        ),
                        const SizedBox(
                          width: 200,
                        ),
                        InkWell(
                          splashColor: Colors.teal,
                          onTap: (){
                            if(formKey.currentState!.validate())
                              navigateTo(context, PasswordPassengerScreen());
                          },
                          child: Image.asset("assets/images/next.png",
                            alignment: Alignment.bottomLeft,
                            width: 70,
                            height: 60,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ),
        );
  }
}
