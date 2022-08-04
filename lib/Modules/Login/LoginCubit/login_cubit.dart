import 'package:busplus/Modules/Login/LoginCubit/login_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(UserLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value)
    {
      print(value.user!.email);
      print(value.user!.uid);

      getIsUserPassengerOrDriver(
          email: email,
          password: password,
          id: value.user!.uid,
      );
    }).catchError((error) {
      emit(UserLoginErrorState(error.toString()));
    });
  }

  Future <void>? getIsUserPassengerOrDriver({
    required String email,
    required String password,
    required String id,
  }) async
  {
    bool? isDriver;
    bool? isBlind;

    await FirebaseFirestore.instance
        .collection('passengers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc)
      {
        if(id == doc["passengerId"] && doc["isBlind"] == true) {
          isDriver = false;
          isBlind = true;
        }
        else if(id == doc["passengerId"] && doc["isBlind"] == false) {
          isDriver = false;
          isBlind = false;
        }
      });
    });
    await FirebaseFirestore.instance
        .collection('drivers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(id == doc["driverId"])
          isDriver = true;
      });
    });
    if(!isDriver! && !isBlind!)
      emit(PassengerLoginSuccessState(id));
    else if (!isDriver! && isBlind!)
      emit(BlindPassengerLoginSuccessState(id));
    else if(isDriver!)
      emit(DriverLoginSuccessState(id));
  }

  void passwordReset({
    required String email,
  }) async
  {
    bool emailExists = false;

    emit(PasswordResetLoadingState());

    await FirebaseFirestore.instance
        .collection('drivers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(email.toLowerCase() == doc["email"])
          emailExists = true;
      });
    });
    await FirebaseFirestore.instance
        .collection('passengers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(email.toLowerCase() == doc["email"])
          emailExists = true;
      });
    });
    if(emailExists)
    {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.toLowerCase()).then((value) {
        emit(PasswordResetSuccessState());
      }).catchError((error){
        emit(PasswordResetErrorState());
      });
    }
    else if(!emailExists)
      emit(PasswordResetEmailNotExistsState());

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