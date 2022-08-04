import 'package:busplus/Models/passenger_model.dart';
import 'package:busplus/Modules/Register/PassengerRegister/PassengerRegisterCubit/passenger_register_states.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PassengerRegisterCubit extends Cubit<PassengerRegisterStates>
{
  PassengerRegisterCubit() : super(PassengerRegisterInitialState());

  static PassengerRegisterCubit get(context) => BlocProvider.of(context);

  Future <void>? passengerRegister({
    required String phone,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required bool isBlind,
  }) async
  {
    bool phoneValid = true;
    bool emailValid = true;

    emit(PassengerRegisterLoadingState());

    await FirebaseFirestore.instance
        .collection('drivers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(phone == doc["phone"])
          phoneValid = false;
        if(email.toLowerCase() == doc["email"])
          emailValid = false;
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
    if(phoneValid && emailValid)
    {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value)
      {
        passengerCreate(
          email: email.toLowerCase(),
          firstName: firstName.capitalize(),
          lastName: lastName.capitalize(),
          phone: phone,
          passengerId: value.user!.uid,
          isBlind: isBlind,
        );
      }).catchError((error){
        emit(PassengerRegisterErrorState(error.toString()));
      });
    }
    else if(!phoneValid)
      emit(PassengerPhoneExistsState());

    else if(!emailValid)
      emit(PassengerEmailExistsState());
  }

  void passengerCreate({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    required String passengerId,
    required bool isBlind,
  })
  {
    PassengerModel passengerModel = PassengerModel(
      phone: phone,
      email: email,
      firstName: firstName,
      lastName: lastName,
      passengerId: passengerId,
      isBlind: isBlind,
    );

    FirebaseFirestore.instance
        .collection('passengers')
        .doc(passengerId)
        .set(passengerModel.toMap())
        .then((value)
    {
      emit(PassengerCreateUserSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(PassengerCreateUserErrorState(error.toString()));
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