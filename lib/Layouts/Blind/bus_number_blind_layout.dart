import 'package:busplus/Layouts/Blind/home_blind_layout.dart';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_cubit.dart';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_states.dart';
import 'package:busplus/Modules/Passenger/PassengerNavigatorDrawer/passenger_navigation_drawer_widget.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlindBusNumberLayout extends StatefulWidget {
  const BlindBusNumberLayout({Key? key}) : super(key: key);

  @override
  State<BlindBusNumberLayout> createState() => _BlindBusNumberLayoutState();
}

class _BlindBusNumberLayoutState extends State<BlindBusNumberLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PassengerCubit, PassengerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawer: const NavigationDrawerWidget(),
          body: Builder(
            builder: (context) {
              return Stack(
                children: <Widget>[
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child:  Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          left: 10.0,
                        ),
                        child: ClipOval(
                          child: Material(
                            color: Colors.teal,
                            child: InkWell(
                              child: const SizedBox(
                                width: 55,
                                height: 55,
                                child: Icon(
                                  Icons.view_headline_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: (){
                                Scaffold.of(context).openDrawer();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                    condition: counter == 1 && PassengerCubit.get(context).busNumber != null,
                    builder: (context) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 110,
                              vertical: 100,
                            ),
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 180,
                              height: 170,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Your bus number is: ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  PassengerCubit.get(context).busNumber.toString(),
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10
                            ),
                            child: Text(
                              'tap on the bottom of the screen to go back',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    fallback: (context) {
                      return Column();
                    },

                  ),
                  ConditionalBuilder(
                    condition: counter == 2 && PassengerCubit.get(context).busNumber == null,
                    builder: (context) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 110,
                              vertical: 100,
                            ),
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 180,
                              height: 170,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "No buses available for this path, please try again.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10
                            ),
                            child: Text(
                              'tap on the bottom of the screen to go back',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    fallback: (context) {
                      return Column();
                    },

                  ),
                  ConditionalBuilder(
                    condition: counter == 3 && PassengerCubit.get(context).busNumber == null,
                    builder: (context) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 110,
                              vertical: 100,
                            ),
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 180,
                              height: 170,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "No buses available for this path, please try again.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10
                            ),
                            child: Text(
                              'tap on the bottom of the screen to go back',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    fallback: (context) {
                      return Column();
                    },

                  ),
                  ConditionalBuilder(
                    condition: counter == 4 && PassengerCubit.get(context).busNumber == null,
                    builder: (context) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 110,
                              vertical: 100,
                            ),
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 180,
                              height: 170,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "No buses available for this path, please try again.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10
                            ),
                            child: Text(
                              'tap on the bottom of the screen to go back',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    fallback: (context) {
                      return Column();
                    },

                  ),
                  ConditionalBuilder(
                    condition: counter == 0 && PassengerCubit.get(context).busNumber != null,
                    builder: (context) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 110,
                              vertical: 100,
                            ),
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 180,
                              height: 170,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Your bus number is: ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  PassengerCubit.get(context).busNumber.toString(),
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10
                            ),
                            child: Text(
                              'tap on the bottom of the screen to go back',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    fallback: (context) {
                      return Column();
                    },

                  ),
                ],
              );
            },
          ),
          bottomSheet: SizedBox(
            height: 360,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: defaultButton(
                    function: (){
                      PassengerCubit.get(context).busNumber = null;
                      navigateAndFinish(context, BlindHomeLayout());
                    },
                    text: 'OK',
                    isUpperCase: false,
                    textColor: Colors.teal,
                    height: 350,
                    width: 185,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
