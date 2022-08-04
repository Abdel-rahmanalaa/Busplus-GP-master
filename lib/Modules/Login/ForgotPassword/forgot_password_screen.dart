import 'package:busplus/Modules/Login/ForgotPassword/forgot_password_succeeded_screen.dart';
import 'package:busplus/Modules/Login/LoginCubit/login_cubit.dart';
import 'package:busplus/Modules/Login/LoginCubit/login_states.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  bool emailNotExists = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer <LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is PasswordResetSuccessState) {
          navigateTo(context, const ForgotPasswordSucceededScreen());
        }
        else if(state is PasswordResetEmailNotExistsState){
          emailNotExists = true;
          formKey.currentState!.validate();
        }
        else if(state is PasswordResetErrorState){
          isError = true;
          formKey.currentState!.validate();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
                'Forgot Password'
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 200,
                horizontal: 10,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text(
                      "Forgot your password?",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    const Text(
                      "Enter your registered email below to receive password reset instruction",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: defaultFormField(
                        controller: passwordResetEmailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if(emailNotExists) {
                            emailNotExists = false;
                            return 'Email doesn\'t exists in our records';
                          }
                          else if(isError){
                            isError = false;
                            return 'Something went wrong. Please try again';
                          }
                          return validate(value!, 'email');
                          },
                        label: 'Email Address',
                        prefix: Icons.email_outlined,
                        suffixPressed: (){},
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    defaultButton(
                      width: 180,
                      function: ()
                      {
                        if(formKey.currentState!.validate())
                          LoginCubit.get(context).passwordReset(email: passwordResetEmailController.text,);
                      },
                      text: 'Send Email',
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
