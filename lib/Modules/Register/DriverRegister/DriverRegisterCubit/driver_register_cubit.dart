import 'package:busplus/Models/driver_model.dart';
import 'package:busplus/Modules/Register/DriverRegister/DriverRegisterCubit/driver_register_states.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DriverRegisterCubit extends Cubit<DriverRegisterStates>
{
  DriverRegisterCubit() : super(DriverRegisterInitialState());

  static DriverRegisterCubit get(context) => BlocProvider.of(context);

  Future <void>? driverRegister({
    required String phone,
    required String email,
    required String firstName,
    required String lastName,
    required String nationalIDNumber,
    required String password,
  }) async
  {
    bool phoneValid = true;
    bool emailValid = true;
    bool nationalIDValid = true;

    emit(DriverRegisterLoadingState());

    await FirebaseFirestore.instance
        .collection('drivers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(phone == doc["phone"])
          phoneValid = false;
        if(email.toLowerCase() == doc["email"])
          emailValid = false;
        if(nationalIDNumber == doc["nationalIDNumber"])
          nationalIDValid = false;
      });
    });
    await FirebaseFirestore.instance
        .collection('passengers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(phone == doc["phone"])
          phoneValid = false;
        if(email.toLowerCase() == doc["email"])
          emailValid = false;
      });
    });

    if(phoneValid && emailValid && nationalIDValid)
    {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value)
      {
        driverCreate(
          phone: phone,
          email: email.toLowerCase(),
          firstName: firstName.capitalize(),
          lastName: lastName.capitalize(),
          nationalIDNumber: nationalIDNumber,
          driverId: value.user!.uid,
        );
      }).catchError((error){
        emit(DriverRegisterErrorState(error.toString()));
      });
    }
    else if(!phoneValid)
      emit(DriverRegisterPhoneExistsState());

    else if(!nationalIDValid)
      emit(DriverRegisterNationalIDExists());

    else if(!emailValid)
      emit(DriverRegisterEmailExistsState());
  }

  void driverCreate({
    required String phone,
    required String email,
    required String firstName,
    required String lastName,
    required String nationalIDNumber,
    required String driverId,
  })
  {
    DriverModel driverModel = DriverModel(
      phone: phone,
      email: email,
      firstName: firstName,
      lastName: lastName,
      nationalIDNumber: nationalIDNumber,
      driverId: driverId,
    );

    FirebaseFirestore.instance
        .collection('drivers')
        .doc(driverId)
        .set(driverModel.toMap())
        .then((value)
    {
      emit(DriverCreateUserSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(DriverCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }
}