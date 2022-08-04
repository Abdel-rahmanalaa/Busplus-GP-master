abstract class DriverStates {}

class DriverInitialState extends DriverStates {}

class GetDriverLoadingState extends DriverStates {}

class GetDriverSuccessState extends DriverStates {}

class GetDriverErrorState extends DriverStates
{
  final String error;

  GetDriverErrorState(this.error);
}

class DriverUpdateLoadingState extends DriverStates {}

class DriverUpdateSuccessState extends DriverStates {}

class DriverUpdateErrorState extends DriverStates {}

class EmailExistsState extends DriverStates {}