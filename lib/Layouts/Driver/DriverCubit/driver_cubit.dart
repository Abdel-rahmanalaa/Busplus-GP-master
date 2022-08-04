import 'package:busplus/Layouts/Driver/DriverCubit/driver_states.dart';
import 'package:busplus/Models/driver_model.dart';
import 'package:busplus/Shared/Components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverCubit extends Cubit<DriverStates> {

  DriverCubit () : super (DriverInitialState());


  static DriverCubit get(context) => BlocProvider.of(context);

  DriverModel? driverModel;

  void updateDriverEmail({
    required String email,
  }) async
  {
    bool emailValid = true;

    emit(DriverUpdateLoadingState());

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
      DriverModel newDriverModel = DriverModel(
        firstName: driverModel!.firstName,
        lastName: driverModel!.lastName,
        phone: driverModel!.phone,
        nationalIDNumber: driverModel!.nationalIDNumber,
        driverId: driverModel!.driverId,
        email: email,
      );

      FirebaseAuth.instance.currentUser!.updateEmail(email);

      FirebaseFirestore.instance
          .collection('drivers')
          .doc(driverModel!.driverId)
          .update(newDriverModel.toMap())
          .then((value)
      {
        emit(DriverUpdateSuccessState());
        getDriverData();
      })
          .catchError((error) {
        emit(DriverUpdateErrorState());
      });
    }
    else if(!emailValid)
      emit(EmailExistsState());

  }

  void getDriverData()
  {
    emit(GetDriverLoadingState());

    if(driverId != null) {
      FirebaseFirestore.instance
          .collection('drivers')
          .doc(driverId)
          .get()
          .then((value) {
        print(value.data());
        driverModel = DriverModel.fromJson(value.data());
        emit(GetDriverSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetDriverErrorState(error.toString()));
      });
    }
  }

}