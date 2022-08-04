import 'package:busplus/Modules/Login/login_screen.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSucceededScreen extends StatelessWidget {
  const ForgotPasswordSucceededScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 80,
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Icon(
              Icons.email_outlined,
              size: 100,
              color: Colors.teal,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Check your email',
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            const Text(
              'We have sent a password recovery instruction to your email',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 430,
            ),
            SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: defaultButton(
                    function: (){
                      navigateTo(context, LoginScreen());
                    },
                    text:'Ok',
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
