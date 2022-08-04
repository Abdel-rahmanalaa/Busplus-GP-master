import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_cubit.dart';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_states.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusNumberPassengerScreen extends StatefulWidget {
  BusNumberPassengerScreen({Key? key}) : super(key: key);

  @override
  State<BusNumberPassengerScreen> createState() => _BusNumberPassengerScreenState();
}

class _BusNumberPassengerScreenState extends State<BusNumberPassengerScreen> {
  List<String> items = [
    'Select Station',
    'masakin eayn shams',
    'maydan alhijaz',
    'altajamue al\'awal',
    'masakin shiratun',
    'ruksi',
    'almizalaat',
    'alnazhuh',
    'alsayidah zaynab',
    'abu alriysh',
    'rawd alfaraj',
    'tariq alfinjarii',
    'aleabaasia',
    'dawaran shibra',
    'zahra madinat nasr',
    'eabaasia',
    'bishtil',
    'kubri uktubar',
    'alkhalifat almamun',
    'alhijaz',
    'al\'alif maskan',
    'mawqif alsalam alnamudhajii',
    'almarj',
    'jisr alsuways',
    'alhayu alsaabie',
    'almazalat',
    'alsabe eimarat',
    'alzaawiat alhamra',
    'alnuzhat aljadida',
    'eabaas aleaqaad',
    'hadayiq alqabih',
    'altajamue',
    'makram eubayd',
    'saray alqabih',
    'alnazhuh aljadida',
    'kuliyat banat eayn shams',
    'tahrir',
    'jiza',
    'alhadayiq',
    'masakin alshuruq',
    'zahra eayn shams',
  ];

  String? startDropVal;
  String? destDropVal;

  void startDropChange(String? val) {
    setState((){
      startDropVal = val!;
    });
  }


  void destDropChange(String? val) {
    setState((){
      destDropVal = val!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PassengerCubit, PassengerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('BusPlus'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButtonFormField<String>(
                  onChanged: startDropChange,
                  value: startDropVal,
                  hint: const Text('Select Station'),
                  decoration: const InputDecoration(
                    labelText: 'Start Station',
                    prefixIcon: Icon(Icons.my_location),
                    filled: true,
                    //border: InputBorder.none,
                  ),
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
              ),
              const Text('To',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButtonFormField<String>(
                  onChanged: destDropChange,
                  value: destDropVal,
                  hint: const Text('Select Station'),
                  decoration: const InputDecoration(
                    labelText: 'Destination Station',
                    prefixIcon: Icon(Icons.my_location),
                    filled: true,
                    //border: InputBorder.none,
                  ),
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    await PassengerCubit.get(context).searchDemo(
                        startStation: startDropVal.toString(),
                        destStation: destDropVal.toString()
                    );
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        context: context,
                        builder: (context){
                          return ConditionalBuilder(
                            condition: PassengerCubit.get(context).busNumber != null,
                            builder: (context) {
                              return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Your bus number is: ',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.teal,
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
                                          ]
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      defaultButton(
                                          function: (){
                                            PassengerCubit.get(context).busNumber = null;
                                            navigateBack(context, BusNumberPassengerScreen());
                                          },
                                          text: 'OK',
                                      ),
                                    ],
                                  )
                              );
                            },
                            fallback: (context) {
                              return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'No buses available for this path, please try again.',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      defaultButton(
                                          function: (){
                                            navigateBack(context, BusNumberPassengerScreen());
                                          },
                                          text: 'OK'),
                                    ],
                                  )
                              );
                            },
                          );
                        }

                    );
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            ],
          ),
        );
      },
    );
  }
}
