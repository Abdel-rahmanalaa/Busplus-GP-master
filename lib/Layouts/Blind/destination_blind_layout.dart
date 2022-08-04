import 'dart:io';

import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_cubit.dart';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_states.dart';
import 'package:busplus/Layouts/Blind/confirm_blind_layout.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import '../../Modules/Passenger/PassengerNavigatorDrawer/passenger_navigation_drawer_widget.dart';

class BlindDestinationLayout extends StatefulWidget {
  const BlindDestinationLayout({Key? key}) : super(key: key);

  @override
  State<BlindDestinationLayout> createState() => _BlindDestinationLayoutState();
}

class _BlindDestinationLayoutState extends State<BlindDestinationLayout> {
  @override
  void initState() {
    super.initState();
  }

  String statusText = "";

  Future<bool> checkRecordPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startDisRecord() async {
    bool hasPermission = await checkRecordPermission();
    if (hasPermission) {
      statusText = "Recording destination station...";
      disRecordFilePath = await getDisFilePath();
      print(disRecordFilePath);
      disIsComplete = false;
      RecordMp3.instance.start(disRecordFilePath!, (type) {
        statusText = "Record destination station error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
  }

  void stopDisRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record destination station complete";
      disIsComplete = true;
      setState(() {});
    }
  }

  int j = 0;

  Future<String> getDisFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record/destination";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/destination_${j++}.mp3";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PassengerCubit, PassengerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: PassengerCubit.get(context).passengerModel != null,
          builder: (context) {
            var passengerModel = PassengerCubit.get(context).passengerModel;
            return Scaffold(
              drawer: const NavigationDrawerWidget(),
              body: Builder(
                builder: (context){
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
                      Column(
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
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Where are you heading?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10
                            ),
                            child: Text(
                              PassengerCubit.get(context).recordText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            splashColor: Colors.white,
                            onTap: ()
                            {
                              PassengerCubit.get(context).changeRecordImage(isAStartRecord: false);
                              if(PassengerCubit.get(context).isDisRecording)
                                startDisRecord();
                              else {
                                stopDisRecord();
                                navigateAndFinish(context, BlindConfirmLayout());
                              }
                            },
                            child: PassengerCubit.get(context).recordImage,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
