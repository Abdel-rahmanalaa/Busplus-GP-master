import 'package:busplus/Layouts/Driver/main_driver.dart';
import 'package:busplus/Layouts/Passenger/home_passenger_layout.dart';
import 'package:busplus/Modules/Login/LoginCubit/login_cubit.dart';
import 'package:busplus/Modules/Login/LoginCubit/login_states.dart';
import 'package:busplus/Modules/Login/ForgotPassword/forgot_password_screen.dart';
import 'package:busplus/Modules/Register/user_register.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:busplus/Shared/Network/Local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Layouts/Blind/home_blind_layout.dart';

class LoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is PassengerLoginSuccessState) {
          CacheHelper.saveData(
            key: 'passengerId',
            value: state.passengerId,
          ).then((value) {
            passengerId = CacheHelper.getData(key: 'passengerId');
            navigateAndFinish(context, const PassengerHomeLayout(),);
          });
        }
        else if(state is BlindPassengerLoginSuccessState) {
          CacheHelper.saveData(
            key: 'blindPassengerId',
            value: state.passengerId,
          ).then((value) {
            blindPassengerId = CacheHelper.getData(key: 'blindPassengerId');
            navigateAndFinish(context, const BlindHomeLayout(),);
          });
        }
        else if(state is DriverLoginSuccessState) {
          CacheHelper.saveData(
            key: 'driverId',
            value: state.driverId,
          ).then((value) {
            driverId = CacheHelper.getData(key: 'driverId');
            navigateAndFinish(context, MainDriverScreen(),);
          });
        }
        else if(state is UserLoginErrorState) {
          wrongCredentials = true;
          formKey.currentState!.validate();
        }
      },
      builder: (context, state) {

        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children:
                  [
                    const SizedBox(
                      height: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 180,
                        height: 170,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: loginEmailController,
                      type: TextInputType.emailAddress,
                      validate: (value)
                      {
                        if(wrongCredentials) {
                          return '';
                        }
                        return validate(value!, 'email');
                      },
                      label: 'Email Address',
                      prefix: Icons.email_outlined,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: loginPasswordController,
                      type: TextInputType.visiblePassword,
                      suffix: LoginCubit.get(context).suffix,
                      isBool: LoginCubit.get(context).isPassword,
                      suffixPressed: () {
                        LoginCubit.get(context).changePasswordVisibility();
                      },
                      onSubmit: (value) {
                        if(formKey.currentState?.validate() != null){
                          LoginCubit.get(context).userLogin(
                              email: loginEmailController.text,
                              password: loginPasswordController.text
                          );
                        }},
                      validate: (value)
                      {
                        if(wrongCredentials){
                          wrongCredentials = false;
                          return 'Incorrect email or password. Please try again';
                        }
                        return validate(value!, 'passwordLogin');
                      },
                      label: "password",
                      prefix: Icons.lock_outlined,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:
                      [
                        defaultTextButton(
                          function: (){
                            navigateTo(context, ForgotPasswordScreen());
                          },
                          text: 'Forgot your password ?',

                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    defaultButton(
                      width: 300,
                      function: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          LoginCubit.get(context).userLogin(
                            email: loginEmailController.text,
                            password: loginPasswordController.text,
                          );
                        }
                      },
                      text: 'Login',
                      isUpperCase: false,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text('or',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 12.0,
                    ),
                    defaultButton(
                      width: 300,
                      function: ()
                      {
                        navigateTo(context, const UserScreen());
                      },
                      text: 'Sign up',
                      isUpperCase: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
