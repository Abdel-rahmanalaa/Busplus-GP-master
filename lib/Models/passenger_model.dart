class PassengerModel
{
  late String phone;
  late String email;
  late String firstName;
  late String lastName;
  late String passengerId;
  late bool isBlind;

  PassengerModel({
    required this.phone,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.passengerId,
    required this.isBlind,
  });

  PassengerModel.fromJson(Map<String, dynamic>? json)
  {
    phone = json!['phone'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    passengerId = json['passengerId'];
    isBlind = json['isBlind'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'phone' : phone,
      'email' : email,
      'firstName' : firstName,
      'lastName' : lastName,
      'passengerId' : passengerId,
      'isBlind' : isBlind,
    };
  }
}