abstract class PassengerRegisterStates {}

class PassengerRegisterInitialState extends PassengerRegisterStates {}

class PassengerRegisterLoadingState extends PassengerRegisterStates {}

class PassengerRegisterSuccessState extends PassengerRegisterStates {}

class PassengerRegisterErrorState extends PassengerRegisterStates {
  final String error;

  PassengerRegisterErrorState(this.error);
}

class PassengerCreateUserSuccessState extends PassengerRegisterStates {}

class PassengerCreateUserErrorState extends PassengerRegisterStates
{
  final String error;

  PassengerCreateUserErrorState(this.error);
}

class PassengerRegisterChangePasswordVisibilityState extends PassengerRegisterStates {}

class PassengerEmailExistsState extends PassengerRegisterStates {}

class PassengerPhoneExistsState extends PassengerRegisterStates {}

class ChangePasswordVisibilityState extends PassengerRegisterStates {}