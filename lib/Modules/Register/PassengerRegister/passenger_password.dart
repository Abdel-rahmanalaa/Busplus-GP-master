import 'package:busplus/Modules/Register/PassengerRegister/PassengerRegisterCubit/passenger_register_cubit.dart';
import 'package:busplus/Modules/Register/PassengerRegister/PassengerRegisterCubit/passenger_register_states.dart';
import 'package:busplus/Modules/Register/PassengerRegister/passenger_email.dart';
import 'package:busplus/Modules/Register/PassengerRegister/passenger_name.dart';
import 'package:busplus/Modules/Register/PassengerRegister/passenger_phone.dart';
import 'package:busplus/Modules/Register/PassengerRegister/passenger_registration_succeeded.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:busplus/Shared/Components/constants.dart';

class PasswordPassengerScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<PassengerRegisterCubit, PassengerRegisterStates>(
      listener: (context, state) {
        if(state is PassengerCreateUserSuccessState) {
          navigateTo(context, RegistrationSucceededScreen());
        }
        else if(state is PassengerEmailExistsState) {
          navigateBack(context, NamePassengerScreen());
          navigateBack(context, EmailPassengerScreen());
        }
        else if(state is PassengerPhoneExistsState) {
          navigateBack(context, NamePassengerScreen());
          navigateBack(context, EmailPassengerScreen());
          navigateBack(context, PhonePassengerScreen());
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
                            controller: passengerPasswordController,
                            type: TextInputType.visiblePassword,
                            suffix: PassengerRegisterCubit.get(context).suffix,
                            isBool: PassengerRegisterCubit.get(context).isPassword,
                            suffixPressed: (){
                              PassengerRegisterCubit.get(context).changePasswordVisibility();
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
                            controller: passengerPasswordConfirmController,
                            type: TextInputType.visiblePassword,
                            suffix: PassengerRegisterCubit.get(context).suffix,
                            isBool: PassengerRegisterCubit.get(context).isPassword,
                            suffixPressed: (){
                              PassengerRegisterCubit.get(context).changePasswordVisibility();
                            },
                            validate: (value) {
                              if(value != passengerPasswordController.text)
                                return 'Those passwords didn’t match. Try again.';
                            },
                            label: "Confirm your password",
                            prefix: Icons.lock_outlined
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
                            {
                              PassengerRegisterCubit.get(context).passengerRegister(
                                phone: passengerPhoneController.text,
                                email: passengerEmailController.text,
                                firstName: passengerFirstNameController.text,
                                lastName: passengerLastNameController.text,
                                password: passengerPasswordController.text,
                                isBlind: isBlind,
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
