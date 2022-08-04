import 'package:busplus/Layouts/Driver/DriverCubit/driver_cubit.dart';
import 'package:busplus/Layouts/Driver/DriverCubit/driver_states.dart';
import 'package:busplus/Modules/Driver/bus_number_driver.dart';
import 'package:busplus/Layouts/Driver/home_driver_layout.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDriverScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriverStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: DriverCubit.get(context).driverModel != null,
          builder: (context) {
            var driverModel = DriverCubit.get(context).driverModel;

            return Scaffold(
              body: Column(
                children: [

                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:
                      [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCpawWq8L8kk4tzxZ6h-svcCsRbQFvUk2KfYnaBg7MOcqvhYdIJUL60i5pBI-f_whkQ90&usqp=CAU'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Welcome,',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${driverModel!.firstName}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  InkWell(
                    splashColor: Colors.teal,
                    onTap: () {
                      navigateTo(context, BusNumberScreen());
                    },
                    child: Image.asset("assets/images/Bus No..png",
                      width: double.infinity,
                      height: 180,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // InkWell(
                  //   splashColor: Colors.teal,
                  //   onTap: () {
                  //     navigateTo(context, const DestinationScreen());
                  //   },
                  //   child: Image.asset("assets/images/Your destination.png",
                  //     width: double.infinity,
                  //     height: 180,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 140,
                  ),
                  defaultButton(
                    function: (){
                      // navigateTo(context, const DriverHomeLayout());
                      navigateTo(context,  DriverHomeLayout());
                    },
                    text: "My Path",
                    width: 260,
                    isUpperCase: false,
                    backgroundColorBox: Colors.teal,
                    textColor: Colors.white,
                  ),
                ],
              ),
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
