import 'dart:convert';
import 'dart:developer';
import 'package:busplus/Models/machine_model.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_states.dart';
import 'package:busplus/Models/passenger_model.dart';
import 'package:busplus/Shared/Components/machineConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PassengerCubit extends Cubit<PassengerStates> {

  PassengerCubit() : super (PassengerInitialState());

  static PassengerCubit get(context) => BlocProvider.of(context);

  PassengerModel? passengerModel;

  var busNumber;
  var startLocation;
  var destlocation;

  Future <void>? searchDemo({
    String startStation = '',
    String destStation = '',
}) async {

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path11', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path11"][0] && destStation == doc["path11"][1]){
          busNumber = 108;
          print(busNumber);
        }
        else if(startStation == doc["path11"][0] && destStation == doc["path11"][2]) {
          busNumber = 108;
          print(busNumber);
        }
        else if(startStation == doc["path11"][1] && destStation == doc["path11"][2]) {
          busNumber = 108;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path13', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path13"][0] && destStation == doc["path13"][1]){
          busNumber = 11;
          print(busNumber);
        }
        else if(startStation == doc["path13"][0] && destStation == doc["path13"][2]) {
          busNumber = 11;
          print(busNumber);
        }
        else if(startStation == doc["path13"][1] && destStation == doc["path13"][2]) {
          busNumber = 11;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path10', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path10"][0] && destStation == doc["path10"][1]){
          busNumber = 112;
          print(busNumber);
        }
        else if(startStation == doc["path10"][0] && destStation == doc["path10"][2]) {
          busNumber = 112;
          print(busNumber);
        }
        else if(startStation == doc["path10"][0] && destStation == doc["path10"][3]) {
          busNumber = 112;
          print(busNumber);
        }
        else if(startStation == doc["path10"][1] && destStation == doc["path10"][2]) {
          busNumber = 112;
          print(busNumber);
        }
        else if(startStation == doc["path10"][1] && destStation == doc["path10"][3]) {
          busNumber = 112;
          print(busNumber);
        }
        else if(startStation == doc["path10"][2] && destStation == doc["path10"][3]) {
          busNumber = 112;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path17', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path17"][0] && destStation == doc["path17"][1]){
          busNumber = 126;
          print(busNumber);
        }
        else if(startStation == doc["path17"][0] && destStation == doc["path17"][2]) {
          busNumber = 126;
          print(busNumber);
        }
        else if(startStation == doc["path17"][1] && destStation == doc["path17"][2]) {
          busNumber = 126;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path18', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path18"][0] && destStation == doc["path18"][1]){
          busNumber = 14;
          print(busNumber);
        }
        else if(startStation == doc["path18"][0] && destStation == doc["path18"][2]) {
          busNumber = 14;
          print(busNumber);
        }
        else if(startStation == doc["path18"][1] && destStation == doc["path18"][2]) {
          busNumber = 14;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path19', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path19"][0] && destStation == doc["path19"][1]){
          busNumber = 159;
          print(busNumber);
        }
        else if(startStation == doc["path19"][0] && destStation == doc["path19"][2]) {
          busNumber = 159;
          print(busNumber);
        }
        else if(startStation == doc["path19"][1] && destStation == doc["path19"][2]) {
          busNumber = 159;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path6', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path6"][0] && destStation == doc["path6"][1]){
          busNumber = 19;
          print(busNumber);
        }
        else if(startStation == doc["path6"][0] && destStation == doc["path6"][2]) {
          busNumber = 19;
          print(busNumber);
        }
        else if(startStation == doc["path6"][0] && destStation == doc["path6"][3]) {
          busNumber = 19;
          print(busNumber);
        }
        else if(startStation == doc["path6"][1] && destStation == doc["path6"][2]) {
          busNumber = 19;
          print(busNumber);
        }
        else if(startStation == doc["path6"][1] && destStation == doc["path6"][3]) {
          busNumber = 19;
          print(busNumber);
        }
        else if(startStation == doc["path6"][2] && destStation == doc["path6"][3]) {
          busNumber = 19;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path12', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path10"][0] && destStation == doc["path10"][1]){
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][0] && destStation == doc["path12"][2]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][0] && destStation == doc["path12"][3]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][0] && destStation == doc["path12"][4]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][0] && destStation == doc["path12"][5]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][0] && destStation == doc["path12"][6]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][1] && destStation == doc["path12"][2]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][1] && destStation == doc["path12"][3]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][1] && destStation == doc["path12"][4]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][1] && destStation == doc["path12"][5]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][1] && destStation == doc["path12"][6]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][2] && destStation == doc["path12"][3]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][2] && destStation == doc["path12"][4]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][2] && destStation == doc["path12"][5]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][2] && destStation == doc["path12"][6]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][3] && destStation == doc["path12"][4]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][3] && destStation == doc["path12"][5]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][3] && destStation == doc["path12"][6]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][4] && destStation == doc["path12"][5]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][4] && destStation == doc["path12"][6]) {
          busNumber = 219;
          print(busNumber);
        }
        else if(startStation == doc["path12"][5] && destStation == doc["path12"][6]) {
          busNumber = 219;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path20', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path20"][0] && destStation == doc["path20"][1]){
          busNumber = 265;
          print(busNumber);
        }
        else if(startStation == doc["path20"][0] && destStation == doc["path20"][2]) {
          busNumber = 265;
          print(busNumber);
        }
        else if(startStation == doc["path20"][1] && destStation == doc["path20"][2]) {
          busNumber = 265;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path8', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path8"][0] && destStation == doc["path8"][1]){
          busNumber = 304;
          print(busNumber);
        }
        else if(startStation == doc["path8"][0] && destStation == doc["path8"][2]) {
          busNumber = 304;
          print(busNumber);
        }
        else if(startStation == doc["path8"][1] && destStation == doc["path8"][2]) {
          busNumber = 304;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path7', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path7"][0] && destStation == doc["path7"][1]){
          busNumber = 60;
          print(busNumber);
        }
        else if(startStation == doc["path7"][0] && destStation == doc["path7"][2]) {
          busNumber = 60;
          print(busNumber);
        }
        else if(startStation == doc["path7"][0] && destStation == doc["path7"][3]) {
          busNumber = 60;
          print(busNumber);
        }
        else if(startStation == doc["path7"][1] && destStation == doc["path7"][2]) {
          busNumber = 60;
          print(busNumber);
        }
        else if(startStation == doc["path7"][1] && destStation == doc["path7"][3]) {
          busNumber = 60;
          print(busNumber);
        }
        else if(startStation == doc["path7"][2] && destStation == doc["path7"][3]) {
          busNumber = 60;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path16', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path16"][0] && destStation == doc["path16"][1]){
          busNumber = 615;
          print(busNumber);
        }
        else if(startStation == doc["path16"][0] && destStation == doc["path16"][2]) {
          busNumber = 615;
          print(busNumber);
        }
        else if(startStation == doc["path16"][1] && destStation == doc["path16"][2]) {
          busNumber = 615;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path15', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path15"][0] && destStation == doc["path15"][1]){
          busNumber = 616;
          print(busNumber);
        }
        else if(startStation == doc["path15"][0] && destStation == doc["path15"][2]) {
          busNumber = 616;
          print(busNumber);
        }
        else if(startStation == doc["path15"][0] && destStation == doc["path15"][3]) {
          busNumber = 616;
          print(busNumber);
        }
        else if(startStation == doc["path15"][1] && destStation == doc["path15"][2]) {
          busNumber = 616;
          print(busNumber);
        }
        else if(startStation == doc["path15"][1] && destStation == doc["path15"][3]) {
          busNumber = 616;
          print(busNumber);
        }
        else if(startStation == doc["path15"][2] && destStation == doc["path15"][3]) {
          busNumber = 616;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path4', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path4"][0] && destStation == doc["path4"][1]){
          busNumber = 617;
          print(busNumber);
        }
        else if(startStation == doc["path4"][0] && destStation == doc["path4"][2]) {
          busNumber = 617;
          print(busNumber);
        }
        else if(startStation == doc["path4"][1] && destStation == doc["path4"][2]) {
          busNumber = 617;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path9', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path9"][0] && destStation == doc["path9"][1]){
          busNumber = 66;
          print(busNumber);
        }
        else if(startStation == doc["path9"][0] && destStation == doc["path9"][2]) {
          busNumber = 66;
          print(busNumber);
        }
        else if(startStation == doc["path9"][0] && destStation == doc["path9"][3]) {
          busNumber = 66;
          print(busNumber);
        }
        else if(startStation == doc["path9"][1] && destStation == doc["path9"][2]) {
          busNumber = 66;
          print(busNumber);
        }
        else if(startStation == doc["path9"][1] && destStation == doc["path9"][3]) {
          busNumber = 66;
          print(busNumber);
        }
        else if(startStation == doc["path9"][2] && destStation == doc["path9"][3]) {
          busNumber = 66;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path5', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path5"][0] && destStation == doc["path5"][1]){
          busNumber = 72;
          print(busNumber);
        }
        else if(startStation == doc["path5"][0] && destStation == doc["path5"][2]) {
          busNumber = 72;
          print(busNumber);
        }
        else if(startStation == doc["path5"][0] && destStation == doc["path5"][3]) {
          busNumber = 72;
          print(busNumber);
        }
        else if(startStation == doc["path5"][1] && destStation == doc["path5"][2]) {
          busNumber = 72;
          print(busNumber);
        }
        else if(startStation == doc["path5"][1] && destStation == doc["path5"][3]) {
          busNumber = 72;
          print(busNumber);
        }
        else if(startStation == doc["path5"][2] && destStation == doc["path5"][3]) {
          busNumber = 72;
          print(busNumber);
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('buses')
        .where('path14', arrayContainsAny: [startStation, destStation])
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(startStation == doc["path14"][0] && destStation == doc["path14"][1]){
          busNumber = 83;
          print(busNumber);
        }
        else if(startStation == doc["path14"][0] && destStation == doc["path14"][2]) {
          busNumber = 83;
          print(busNumber);
        }
        else if(startStation == doc["path14"][1] && destStation == doc["path14"][2]) {
          busNumber = 83;
          print(busNumber);
        }
      });
    });
  }

  void updatePassengerEmail({
    required String email,
  }) async
  {
    bool emailValid = true;

    emit(PassengerUpdateLoadingState());

    await FirebaseFirestore.instance
        .collection('drivers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(email.toLowerCase() == doc["email"])
          emailValid = false;
      });
    });
    await FirebaseFirestore.instance
        .collection('passengers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(email.toLowerCase() == doc["email"])
          emailValid = false;
      });
    });

    if(emailValid)
    {
      PassengerModel newPassengerModel = PassengerModel(
        firstName: passengerModel!.firstName,
        lastName: passengerModel!.lastName,
        phone: passengerModel!.phone,
        isBlind: passengerModel!.isBlind,
        passengerId: passengerModel!.passengerId,
        email: email,
      );

      FirebaseAuth.instance.currentUser!.updateEmail(email);

      FirebaseFirestore.instance
          .collection('passengers')
          .doc(passengerModel!.passengerId)
          .update(newPassengerModel.toMap())
          .then((value)
      {
        emit(PassengerUpdateSuccessState());
        getPassengerData();
      })
          .catchError((error) {
        emit(PassengerUpdateErrorState());
      });
    }
    else if(!emailValid)
      emit(EmailExistsState());
  }

  void getPassengerData()
  {
    emit(GetPassengerLoadingState());
    if(passengerId != null) {
      FirebaseFirestore.instance
          .collection('passengers')
          .doc(passengerId)
          .get()
          .then((value) {
        print(value.data());
        passengerModel = PassengerModel.fromJson(value.data());
        emit(GetPassengerSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetPassengerErrorState(error.toString()));
      });
    }
    else if(blindPassengerId != null) {
      FirebaseFirestore.instance
          .collection('passengers')
          .doc(blindPassengerId)
          .get()
          .then((value) {
        print(value.data());
        passengerModel = PassengerModel.fromJson(value.data());
        emit(GetPassengerSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetPassengerErrorState(error.toString()));
      });
    }
  }

  MachineModel? machineModel;

  void getResponse(String filePath, String text) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.endpoint);
      var request = http.MultipartRequest('POST', url);
      Map<String, String> headers = {'Authorization': ApiConstants.apiKey};
      request.files.add(await http.MultipartFile.fromPath('file', filePath));
      request.headers.addAll(headers);
      var response = await request.send();
      if(text == 'startStation')
      {
        if (response.statusCode == 200) {
          print('start station record uploaded');
          response.stream.transform(utf8.decoder).listen((value) {
            machineModel = machineModelStartStationFromJson(value);
            print(machineModel!.startStation);
          });
        }
        else if (response.statusCode == 400) {
          print('start station record didn\'t upload');
          response.stream.transform(utf8.decoder).listen((value) {
            machineModel = machineModelStartStationFromJson(value);
            print(machineModel!.startStationError);
          });
        }
      }
      else if(text == 'destinationStation')
      {
        if (response.statusCode == 200) {
          print('destination station record uploaded');
          response.stream.transform(utf8.decoder).listen((value) {
            machineModel = machineModelDestinationFromJson(value);
            print(machineModel!.destinationStation);
          });
        }
        else if (response.statusCode == 400) {
          print('destination station didn\'t upload');
          response.stream.transform(utf8.decoder).listen((value) {
            machineModel = machineModelStartStationFromJson(value);
            print(machineModel!.destinationStationError);
          });
        }
      }

    } catch (e) {
      log(e.toString());
    }
  }

  Image recordImage = Image.asset("assets/images/mic.png",
    width: 350,
    height: 350,
  );
  String recordText = 'Tap on the bottom of the screen to start the recording';

  bool isStartRecording = false;
  bool isDisRecording = false;

  void changeRecordImage({
  required bool isAStartRecord,
})
  {
    if(isAStartRecord){
      isStartRecording = !isStartRecording;
      recordImage = isStartRecording ?
      Image.asset("assets/images/stop.png",
        width: 350,
        height: 350,
      ) :
      Image.asset("assets/images/mic.png",
        width: 350,
        height: 350,
      );

      recordText = isStartRecording ?
      'Tap on the bottom of the screen to stop the recording' :
      'Tap on the bottom of the screen to start the recording';
    }
    else {
      isDisRecording = !isDisRecording;
      recordImage = isDisRecording ?
      Image.asset("assets/images/stop.png",
        width: 350,
        height: 350,
      ) :
      Image.asset("assets/images/mic.png",
        width: 350,
        height: 350,
      );

      recordText = isDisRecording ?
      'Tap on the bottom of the screen to stop the recording' :
      'Tap on the bottom of the screen to start the recording';
    }

  }

  // Set <int> busNumber = {108, 11 , 112, 126, 14, 159, 19, 219, 265, 304, 60, 615, 616, 617, 66, 72, 83};
  List <String>? bus;

}