import 'package:busplus/Modules/Register/DriverRegister/DriverRegisterCubit/driver_register_cubit.dart';
import 'package:busplus/Modules/Register/DriverRegister/DriverRegisterCubit/driver_register_states.dart';
import 'package:busplus/Modules/Register/DriverRegister/driver_name.dart';
import 'package:busplus/Modules/Register/DriverRegister/driver_national_id.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailDriverScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DriverRegisterCubit, DriverRegisterStates>(
      listener: (context, state) {
        if(state is DriverRegisterEmailExistsState)
        {
          driverEmailExists = true;
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
                        controller: driverEmailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if(driverEmailExists || driverEmailController.text == driverPattern)
                          {
                            driverPattern = driverEmailController.text;
                            driverEmailExists = false;
                            return 'Email already exists';
                          }
                          return validate(value!, 'email');
                        },
                        label: "Email",
                        prefix: Icons.email),
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
                            navigateBack(context, NationalIDDriverScreen());
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
                              navigateTo(context, NameDriverScreen());
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
