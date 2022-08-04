import 'package:busplus/Modules/Login/login_screen.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';

class RegistrationSucceededScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 42,
        ),
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Mask Group 1.png"),
                fit: BoxFit.cover,
              ),
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 230,
              ),
              Center(
                child: Image.asset(
                  "assets/images/reg logo.png",
                  width: 340,
                  height: 300,
                ),
              ),
              const SizedBox(
                height: 132,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: InkWell(
                  splashColor: Colors.teal,
                  onTap: (){
                    navigateTo(context, LoginScreen());
                  },
                  child: Image.asset("assets/images/Back to login.png",
                    alignment: Alignment.bottomLeft,
                    width: 132,
                    height: 90,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*
Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children:
[
Container(
decoration: const BoxDecoration(
image: DecorationImage(
image: AssetImage("assets/images/Mask Group 1.png"),
fit: BoxFit.cover,
),
)
),
*/
/* Center(
              child: Image.asset(
                "assets/images/Mask Group 1.png",
                width: 500,
                height: 300,
              ),
            ),*//*

Center(
child: Image.asset(
"assets/images/reg logo.png",
width: 350,
height: 300,
),
),
const SizedBox(
height: 100,
),
Padding(
padding: const EdgeInsets.all(25.0),
child: InkWell(
splashColor: Colors.teal,
onTap: (){
navigateTo(context, const LoginScreen());
},
child: Image.asset("assets/images/Back to login.png",
alignment: Alignment.bottomLeft,
width: 70,
height: 60,
),
),
),
]
),*/
