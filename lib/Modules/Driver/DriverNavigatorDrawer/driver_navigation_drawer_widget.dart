import 'package:busplus/Layouts/Driver/DriverCubit/driver_cubit.dart';
import 'package:busplus/Layouts/Driver/DriverCubit/driver_states.dart';
import 'package:busplus/Layouts/Driver/main_driver.dart';
import 'package:busplus/Modules/Driver/DriverNavigatorDrawer/driver_drawer_item.dart';
import 'package:busplus/Modules/Driver/DriverNavigatorDrawer/driver_help.dart';
import 'package:busplus/Modules/Driver/DriverNavigatorDrawer/driver_settings.dart';
import 'package:busplus/Modules/Driver/DriverNavigatorDrawer/driver_share_location.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverNavigationDrawerWidget extends StatelessWidget {
  const DriverNavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DriverCubit()..getDriverData(),
      child: BlocConsumer<DriverCubit, DriverStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Drawer(
            child: Material(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
                child: Column(
                  children:
                  [
                    driverHeaderWidget(context),
                    const SizedBox(
                      height: 30,),
                    const Divider(
                      thickness: 1,
                      height: 10,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DriverDrawerItem(
                      icon: Icons.home_outlined,
                      title: 'Home',
                      onTap: () => onItemPressed(context, index: 0),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DriverDrawerItem(
                      icon: Icons.settings,
                      title: 'Settings',
                      onTap: () => onItemPressed(context, index: 1),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DriverDrawerItem(
                      icon: Icons.help_outline,
                      title: 'Help',
                      onTap: () => onItemPressed(context, index: 2),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DriverDrawerItem(
                      icon: Icons.share_outlined,
                      title: 'Share Location',
                      onTap: () => onItemPressed(context, index: 3),
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
                    DriverDrawerItem(
                      icon: Icons.logout_outlined,
                      title: 'SignOut',
                      titleColor: Colors.black,
                      iconColor: Colors.black,
                      onTap: () => onItemPressed(context, index: 4,),
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
        navigateBack(context, MainDriverScreen());
        break;
      case 1:
        navigateTo(context, DriverSettingsScreen());
        break;
      case 2:
        navigateTo(context, const DriverHelpScreen());
        break;
      case 3:
        navigateTo(context, const DriverShareLocationScreen());
        break;
      case 4:
        driverSignOut (context);
        break;
    }

  }

  Widget driverHeaderWidget(context)
  {
    var driverModel = DriverCubit.get(context).driverModel;
    return ConditionalBuilder(
      condition: DriverCubit.get(context).driverModel != null,
      builder: (context){
        return Row(
          children:
          [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCpawWq8L8kk4tzxZ6h-svcCsRbQFvUk2KfYnaBg7MOcqvhYdIJUL60i5pBI-f_whkQ90&usqp=CAU'),
            ),
            const SizedBox(
              width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${driverModel!.firstName} ${driverModel.lastName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${driverModel.email}',
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
