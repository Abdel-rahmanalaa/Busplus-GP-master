import 'package:busplus/Modules/Register/DriverRegister/DriverRegisterCubit/driver_register_cubit.dart';
import 'package:busplus/Modules/Register/DriverRegister/DriverRegisterCubit/driver_register_states.dart';
import 'package:busplus/Modules/Register/DriverRegister/driver_national_id.dart';
import 'package:busplus/Modules/Register/user_register.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneDriverScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DriverRegisterCubit, DriverRegisterStates>(
      listener: (context, state) {
        if(state is DriverRegisterPhoneExistsState)
        {
          driverPhoneExists = true;
          formKey.currentState!.validate();
        }
      },
      builder: (context, state) {
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
                    padding: const EdgeInsets.all(25.0),
                    child: defaultFormField(
                        controller: driverPhoneController,
                        type: TextInputType.phone,
                        validate: (value) {
                          if(driverPhoneExists || driverPhoneController.text == driverPattern)
                          {
                            driverPattern = driverPhoneController.text;
                            driverPhoneExists = false;
                            return 'Phone number already exists';
                          }
                          return validate(value!, 'phone');
                        },
                        label: "Phone",
                        prefix: Icons.phone
                    ),
                  ),
                  const SizedBox(
                    height: 240,
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
                            navigateBack(context, const UserScreen());
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
                              navigateTo(context, NationalIDDriverScreen());
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
      },
    );
  }
}
