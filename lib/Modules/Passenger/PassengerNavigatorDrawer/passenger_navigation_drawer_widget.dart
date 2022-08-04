import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_cubit.dart';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_states.dart';
import 'package:busplus/Modules/Passenger/PassengerNavigatorDrawer/passenger_drawer_item.dart';
import 'package:busplus/Modules/Passenger/PassengerNavigatorDrawer/passenger_help.dart';
import 'package:busplus/Modules/Passenger/PassengerNavigatorDrawer/passenger_settings.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PassengerCubit()..getPassengerData(),
      child: BlocConsumer<PassengerCubit, PassengerStates>(
        listener: (context,state) {
        },
        builder: (context,state) {
          return Drawer(
            child: Material(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
                child: Column(
                  children:
                  [
                    headerWidget(context),
                    const SizedBox(
                      height: 30,),
                    const Divider(
                      thickness: 1,
                      height: 10,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PassengerDrawerItem(
                      icon: Icons.settings,
                      title: 'Settings',
                      onTap: () => onItemPressed(context, index: 0),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PassengerDrawerItem(
                      icon: Icons.help_outline,
                      title: 'Help',
                      onTap: () => onItemPressed(context, index: 1),
                    ),
                    const SizedBox(
                      height: 30,),
                    const Divider(
                      thickness: 1,
                      height: 10,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PassengerDrawerItem(
                      icon: Icons.logout_outlined,
                      title: 'SignOut',
                      titleColor: Colors.black,
                      iconColor: Colors.black,
                      onTap: () => onItemPressed(context, index: 2),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index})
  {
    Navigator.pop(context);

    switch(index)
    {
      case 0:
        navigateTo(context, PassengerSettingsScreen());
        break;
      case 1:
        navigateTo(context, const PassengerHelpScreen());
        break;
      case 2:
        passengerSignOut (context);
        blindPassengerSignOut(context);
        break;
    }

  }

  Widget headerWidget(context)
  {
    var passengerModel = PassengerCubit.get(context).passengerModel;
    return ConditionalBuilder(
      condition: PassengerCubit.get(context).passengerModel != null,
      builder: (context) {
        return Row(
          children:
          [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCpawWq8L8kk4tzxZ6h-svcCsRbQFvUk2KfYnaBg7MOcqvhYdIJUL60i5pBI-f_whkQ90&usqp=CAU'),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${passengerModel!.firstName} ${passengerModel.lastName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${passengerModel.email}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        );
      },
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
  }
}
