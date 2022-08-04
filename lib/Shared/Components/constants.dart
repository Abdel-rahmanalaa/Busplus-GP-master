import 'package:busplus/Modules/Login/login_screen.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:busplus/Shared/Network/Local/cache_helper.dart';
import 'package:flutter/material.dart';

void passengerSignOut (context)
{
  CacheHelper.removeData(key: 'passengerId',).then((value) {
    if(value)
      navigateAndFinish(context, LoginScreen(),);
  });
}
void blindPassengerSignOut (context)
{
  CacheHelper.removeData(key: 'blindPassengerId',).then((value) {
    if(value)
      navigateAndFinish(context, LoginScreen(),);
  });
}
void driverSignOut (context)
{
  CacheHelper.removeData(key: 'driverId',).then((value) {
    if(value)
      navigateAndFinish(context, LoginScreen(),);
  });
}

// user login variables

var loginEmailController = TextEditingController();

var loginPasswordController = TextEditingController();

var passwordResetEmailController = TextEditingController();

bool wrongCredentials = false;

// passenger variables

var passengerEmailController = TextEditingController();

var passengerFirstNameController = TextEditingController();

var passengerLastNameController = TextEditingController();

var passengerPhoneController = TextEditingController();

var passengerPasswordController = TextEditingController();

var passengerPasswordConfirmController = TextEditingController();

var passengerPattern;

bool isBlind = false;

String? passengerId;

String? blindPassengerId;

bool passengerEmailExists = false;

bool passengerPhoneExists = false;

// driver variables

var driverFirstNameController = TextEditingController();

var driverLastNameController = TextEditingController();

var driverEmailController = TextEditingController();

var driverNationalIDController = TextEditingController();

var driverPhoneController = TextEditingController();

var driverPasswordController = TextEditingController();

var driverPasswordConfirmController = TextEditingController();

var driverPattern;

String? driverId;

bool driverEmailExists = false;

bool driverPhoneExists = false;

bool driverNationalIDExists = false;

int counter = 0;

// record variables

bool startIsComplete = false;
bool disIsComplete = false;

String? startRecordFilePath;
String? disRecordFilePath;
