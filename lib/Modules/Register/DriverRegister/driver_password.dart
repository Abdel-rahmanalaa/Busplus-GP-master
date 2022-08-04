import 'package:busplus/Modules/Register/DriverRegister/DriverRegisterCubit/driver_register_cubit.dart';
import 'package:busplus/Modules/Register/DriverRegister/DriverRegisterCubit/driver_register_states.dart';
import 'package:busplus/Modules/Register/DriverRegister/driver_email.dart';
import 'package:busplus/Modules/Register/DriverRegister/driver_name.dart';
import 'package:busplus/Modules/Register/DriverRegister/driver_national_id.dart';
import 'package:busplus/Modules/Register/DriverRegister/driver_phone.dart';
import 'package:busplus/Modules/Register/DriverRegister/driver_registration_succeeded.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordDriverScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DriverRegisterCubit, DriverRegisterStates>(
      listener: (context, state) {
        if(state is DriverCreateUserSuccessState) {
          navigateTo(context, RegistrationSucceededScreen());
        }
        else if(state is DriverRegisterEmailExistsState) {
          navigateBack(context, NameDriverScreen());
          navigateBack(context, EmailDriverScreen());
        }
        else if(state is DriverRegisterNationalIDExists) {
          navigateBack(context, NameDriverScreen());
          navigateBack(context, EmailDriverScreen());
          navigateBack(context, NationalIDDriverScreen());
        }
        else if(state is DriverRegisterPhoneExistsState) {
          navigateBack(context, NameDriverScreen());
          navigateBack(context, EmailDriverScreen());
          navigateBack(context, NationalIDDriverScreen());
          navigateBack(context, PhoneDriverScreen());
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
                    child: Column(
                      children:
                      [
                        defaultFormField(
                            controller: driverPasswordController,
                            type: TextInputType.visiblePassword,
                            suffix: DriverRegisterCubit.get(context).suffix,
                            isBool: DriverRegisterCubit.get(context).isPassword,
                            suffixPressed: (){
                              DriverRegisterCubit.get(context).changePasswordVisibility();
                            },
                            validate: (value) {
                              return validate(value!, 'passwordRegister');
                            },
                            label: "Password",
                            prefix: Icons.lock_outlined,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            controller: driverPasswordConfirmController,
                            type: TextInputType.visiblePassword,
                            suffix: DriverRegisterCubit.get(context).suffix,
                            isBool: DriverRegisterCubit.get(context).isPassword,
                            suffixPressed: (){
                              DriverRegisterCubit.get(context).changePasswordVisibility();
                            },
                            validate: (value) {
                              if(value != driverPasswordController.text)
                                return 'Those passwords didn’t match. Try again.';
                            },
                            label: "Confirm your password",
                            prefix: Icons.lock_outlined,
                        ),
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
                            navigateBack(context, NameDriverScreen());
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
                            {
                              DriverRegisterCubit.get(context).driverRegister(
                                phone: driverPhoneController.text,
                                email: driverEmailController.text,
                                firstName: driverFirstNameController.text,
                                lastName: driverLastNameController.text,
                                nationalIDNumber: driverNationalIDController.text,
                                password: driverPasswordController.text,
                              );
                            }
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
