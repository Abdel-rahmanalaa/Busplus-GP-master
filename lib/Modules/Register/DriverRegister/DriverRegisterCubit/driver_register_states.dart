abstract class DriverRegisterStates {}

class DriverRegisterInitialState extends DriverRegisterStates {}

class DriverRegisterLoadingState extends DriverRegisterStates {}

class DriverRegisterSuccessState extends DriverRegisterStates {}

class DriverRegisterErrorState extends DriverRegisterStates {
  final String error;

  DriverRegisterErrorState(this.error);
}

class DriverCreateUserSuccessState extends DriverRegisterStates {}

class DriverCreateUserErrorState extends DriverRegisterStates
{
  final String error;

  DriverCreateUserErrorState(this.error);
}

class DriverRegisterChangePasswordVisibilityState extends DriverRegisterStates {}

class DriverRegisterEmailExistsState extends DriverRegisterStates {}

class DriverRegisterPhoneExistsState extends DriverRegisterStates {}

class DriverRegisterNationalIDExists extends DriverRegisterStates {}

class ChangePasswordVisibilityState extends DriverRegisterStates {}