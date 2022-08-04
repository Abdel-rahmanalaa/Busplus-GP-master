class DriverModel
{
  late String phone;
  late String email;
  late String firstName;
  late String lastName;
  late String nationalIDNumber;
  late String driverId;

  DriverModel({
    required this.phone,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.nationalIDNumber,
    required this.driverId,
  });

  DriverModel.fromJson(Map<String, dynamic>? json)
  {
    phone = json!['phone'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    nationalIDNumber = json['nationalIDNumber'];
    driverId = json['driverId'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'phone' : phone,
      'email' : email,
      'firstName' : firstName,
      'lastName' : lastName,
      'nationalIDNumber' : nationalIDNumber,
      'driverId' : driverId,
    };
  }
}