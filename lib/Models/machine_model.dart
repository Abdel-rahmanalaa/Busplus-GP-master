import 'dart:convert';

MachineModel machineModelStartStationFromJson(String str) => MachineModel.startStationFromJson(json.decode(str));

MachineModel machineModelDestinationFromJson(String str) => MachineModel.destinationStationFromJson(json.decode(str));

String machineModelStartStationToJson(MachineModel data) => json.encode(data.startStationToJson());

String machineModelDestinationStationToJson(MachineModel data) => json.encode(data.destinationStationToJson());

class MachineModel {
  MachineModel({
    this.startStation,
    this.startStationError,
    this.destinationStation,
    this.destinationStationError,
  });

  String? startStation;
  String? startStationError;
  String? destinationStation;
  String? destinationStationError;

  factory MachineModel.startStationFromJson(Map<String, dynamic> json) => MachineModel(
    startStation: json["text"],
    startStationError: json["error"],
  );
  factory MachineModel.destinationStationFromJson(Map<String, dynamic> json) => MachineModel(
    destinationStation: json["text"],
    destinationStationError: json["error"],
  );

  Map<String, dynamic> startStationToJson() => {
    "text": startStation,
    "error": startStationError,
  };
  Map<String, dynamic> destinationStationToJson() => {
    "text": destinationStation,
    "error": destinationStationError,
  };
}
