import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:busplus/Layouts/Blind/home_blind_layout.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BlindPassengerSplashScreen extends StatelessWidget {
  const BlindPassengerSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:
          [
            Image.asset(
              "assets/images/main_logo.png",
              width: 400,
              height: 300,
            ),
            const SizedBox(height: 200.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children:
              [
                Image.asset(
                  "assets/images/egylogo.png",
                  width: 70,
                  height: 70,
                ),
                const SizedBox(width: 25.0,),
                Image.asset(
                  "assets/images/CTA.png",
                  width: 70,
                  height: 70,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      splashIconSize: 600,
      duration: 1500,
      animationDuration: const Duration(seconds: 1),
      nextScreen:  BlindHomeLayout(),
    );
  }
}