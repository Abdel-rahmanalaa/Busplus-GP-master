abstract class PassengerStates {}

class PassengerInitialState extends PassengerStates {}

class GetPassengerLoadingState extends PassengerStates {}

class GetPassengerSuccessState extends PassengerStates {}

class GetPassengerErrorState extends PassengerStates
{
  final String error;

  GetPassengerErrorState(this.error);
}

class PassengerUpdateLoadingState extends PassengerStates {}

class PassengerUpdateSuccessState extends PassengerStates {}

class PassengerUpdateErrorState extends PassengerStates {}

class EmailExistsState extends PassengerStates {}