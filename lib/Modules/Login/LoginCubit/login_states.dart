abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangePasswordVisibilityState extends LoginStates {}

class UserLoginLoadingState extends LoginStates {}

class UserLoginErrorState extends LoginStates
{
  final String error;

  UserLoginErrorState(this.error);
}

class PassengerLoginSuccessState extends LoginStates
{
  final String passengerId;

  PassengerLoginSuccessState(this.passengerId);
}

class BlindPassengerLoginSuccessState extends LoginStates
{
  final String passengerId;

  BlindPassengerLoginSuccessState(this.passengerId);
}

class DriverLoginSuccessState extends LoginStates
{
  final String driverId;

  DriverLoginSuccessState(this.driverId);
}

class PasswordResetLoadingState extends LoginStates {}

class PasswordResetSuccessState extends LoginStates {}

class PasswordResetErrorState extends LoginStates {}

class PasswordResetEmailNotExistsState extends LoginStates {}