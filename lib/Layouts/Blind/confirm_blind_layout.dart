import 'package:busplus/Layouts/Blind/bus_number_blind_layout.dart';
import 'package:busplus/Layouts/Blind/home_blind_layout.dart';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_cubit.dart';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_states.dart';
import 'package:busplus/Modules/Passenger/PassengerNavigatorDrawer/passenger_navigation_drawer_widget.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Components/constants.dart';

class BlindConfirmLayout extends StatefulWidget {
  const BlindConfirmLayout({Key? key}) : super(key: key);

  @override
  State<BlindConfirmLayout> createState() => _BlindConfirmLayoutState();
}

class _BlindConfirmLayoutState extends State<BlindConfirmLayout> {
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
                   condition: counter == 0,
                   builder: (context){
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
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: const [
                               Text(
                                 "Your current location is: ",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                               Text(
                                 "ruksi",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(
                             vertical: 7,
                             horizontal: 10,
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text(
                                 "You want to go to: ",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                               Text(
                                 "tahrir",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
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
                             'Tap on the right side of the screen to confirm, or the left side to record again',
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
                   condition: counter == 1,
                   builder: (context){
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
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: const [
                               Text(
                                 "Your current location is: ",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                               Text(
                                 "tahrir",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(
                             vertical: 7,
                             horizontal: 10,
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: const [
                               Text(
                                 "You want to go to: ",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                               Text(
                                 "ruksi",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
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
                             'Tap on the right side of the screen to confirm, or the left side to record again',
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
                   condition: counter == 2,
                   builder: (context){
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
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: const [
                               Text(
                                 "Your current location is: ",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                               Text(
                                 "masakin eayn shams",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(
                             vertical: 7,
                             horizontal: 10,
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text(
                                 "You want to go to: ",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                               Text(
                                 "cobery octobor",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
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
                             'Tap on the right side of the screen to confirm, or the left side to record again',
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
                   condition: counter == 3,
                   builder: (context){
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
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: const [
                               Text(
                                 "Your current location is: ",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                               Text(
                                 "not found",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(
                             vertical: 7,
                             horizontal: 10,
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: const [
                               Text(
                                 "You want to go to: ",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                               Text(
                                 "not found",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
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
                             'Tap on the right side of the screen to confirm, or the left side to record again',
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
                   condition: counter == 4,
                   builder: (context){
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
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: const [
                               Text(
                                 "Your current location is: ",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                               Text(
                                 "masakin eayn shams",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(
                             vertical: 7,
                             horizontal: 10,
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: const[
                               Text(
                                 "You want to go to: ",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
                                     fontWeight: FontWeight.w400
                                 ),
                               ),
                               Text(
                                 "maydan alhijaz",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 17,
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
                             'Tap on the right side of the screen to confirm, or the left side to record again',
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
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 5,
                     ),
                     child: defaultButton(
                       function: (){
                         counter++;
                         if(counter == 5)
                           counter = 0;

                         navigateAndFinish(context, BlindHomeLayout());
                       },
                       text: 'Try Again',
                       isUpperCase: false,
                       textColor: Colors.teal,
                       height: 350,
                       width: 185,
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: defaultButton(
                       backgroundColorBox: Colors.teal,
                       function: () async {
                         if(counter == 0) {
                            await PassengerCubit.get(context).searchDemo(
                              startStation: 'ruksi',
                              destStation: 'tahrir',
                            );
                          }
                         else if(counter == 1) {
                           await PassengerCubit.get(context).searchDemo(
                             startStation: 'tahrir',
                             destStation: 'ruksi',
                           );
                         }
                         else if(counter == 2) {
                           await PassengerCubit.get(context).searchDemo(
                             startStation: 'masakin eayn shams',
                             destStation: 'cobery octobor',
                           );
                         }
                         else if(counter == 3) {
                           await PassengerCubit.get(context).searchDemo(
                             startStation: '',
                             destStation: '',
                           );
                         }
                         else if(counter == 4) {
                           await PassengerCubit.get(context).searchDemo(
                             startStation: 'masakin eayn shams',
                             destStation: 'maydan alhijaz',
                           );
                         }

                         counter++;
                         if(counter == 5)
                           counter = 0;

                          if(startIsComplete && startRecordFilePath != null)
                           PassengerCubit.get(context).getResponse(startRecordFilePath!, 'startStation');
                         if(disIsComplete && disRecordFilePath != null)
                           PassengerCubit.get(context).getResponse(disRecordFilePath!, 'destinationStation');
                         navigateAndFinish(context, const BlindBusNumberLayout(),
                         );
                       },
                       text: 'Confirm',
                       isUpperCase: false,
                       textColor: Colors.white,
                       height: 350,
                       width: 185,
                     ),
                   ),
                 ],
               ),
             ],
           ),
         ),
       );
     },
   );
  }
}
