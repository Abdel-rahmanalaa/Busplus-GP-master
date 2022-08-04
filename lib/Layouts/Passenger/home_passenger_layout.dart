import 'dart:async';
import 'dart:math';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_cubit.dart';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_states.dart';
import 'package:busplus/Layouts/Passenger/bus_number_passenger.dart';
import 'package:busplus/Modules/Passenger/PassengerNavigatorDrawer/passenger_navigation_drawer_widget.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class PassengerHomeLayout extends StatefulWidget {
  const PassengerHomeLayout({Key? key}) : super(key: key);

  @override
  State<PassengerHomeLayout> createState() => _PassengerHomeLayoutState();
}

class _PassengerHomeLayoutState extends State<PassengerHomeLayout> {

  @override
  void initState() {
    super.initState();
    initLocation();
    getPassengerPosition();
  }

  Future initLocation() async {
    final status = await Permission.location.request();

    if (status != PermissionStatus.granted)
      throw 'Location permission not granted';
  }

  Completer<GoogleMapController> _passengerController = Completer();
  late GoogleMapController newGoogleMapController;

  CameraPosition _initialLocation = const CameraPosition(target: LatLng(26.8206, 30.8025));

  late Position currentPassengerPosition;
  String currentPassengerAddress = '';

  var geoLocator = Geolocator();

  String startPassengerAddress = '';
  String destinationPassengerAddress = '';
  String? placePassengerDistance;

  var destinationController = TextEditingController();
  var startAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final destinationAddressFocusNode = FocusNode();

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  void getPassengerPosition() async{
    Position passengerPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPassengerPosition = passengerPosition;
    print('Current POS: $passengerPosition');
    LatLng latLngPassengerPosition = LatLng(passengerPosition.latitude, passengerPosition.longitude);

    CameraPosition cameraPassengerPosition = new CameraPosition(target: latLngPassengerPosition, zoom: 18);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPassengerPosition));

    getAddress();
  }

  void getAddress ()async
  {
    try{
      //
      List<Placemark> p = await placemarkFromCoordinates(currentPassengerPosition.latitude, currentPassengerPosition.longitude);
      //
      Placemark place = p[0];

      setState(() {
        currentPassengerAddress = "${place.locality},${place.street}, ${place.country}";
        startAddressController.text = currentPassengerAddress;
        startPassengerAddress = currentPassengerAddress;
      });
    }catch (error){
      print(error);
    }
  }

  Future<bool> calculatePassengerDistance() async{
    try{
      // Retrieving placeMarks from addresses
      //
      List<Location>? startPlaceMark = await locationFromAddress(startPassengerAddress);
      List<Location>? destinationPlaceMark =
      //
      await locationFromAddress(destinationPassengerAddress);

      double startLatitude = startPassengerAddress == currentPassengerAddress
          ? currentPassengerPosition.latitude
      //
          : startPlaceMark[0].latitude;

      double startLongitude = startPassengerAddress == currentPassengerAddress
          ? currentPassengerPosition.longitude
      //
          : startPlaceMark[0].longitude;

      //
      double destinationLatitude = destinationPlaceMark[0].latitude;
      //
      double destinationLongitude = destinationPlaceMark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString = '($destinationLatitude, $destinationLongitude)';

      // Start Location Marker
      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: startPassengerAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: destinationPassengerAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Adding the markers to the list
      markers.add(startMarker);
      markers.add(destinationMarker);

      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;


      // Accommodate the two locations within the
      // camera view of the map
      newGoogleMapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );

      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;

      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      setState(() {
        placePassengerDistance = totalDistance.toStringAsFixed(2);
        print('DISTANCE: $placePassengerDistance km');
      });

      return true;

    }catch(error){
      print(error);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude,
      ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDJYnB_gX_IGds9kiL-2WfAZz0hYh9FtEY", // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      //
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PassengerCubit, PassengerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: PassengerCubit.get(context).passengerModel != null,
          builder: (context) {
            var passengerModel = PassengerCubit.get(context).passengerModel;
            return Scaffold(
              drawer: const NavigationDrawerWidget(),
              body: Builder(
                builder: (context){
                  return Stack(
                    children:<Widget>
                    [
                      GoogleMap(
                        markers: Set<Marker>.from(markers),
                        initialCameraPosition: _initialLocation,
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        zoomGesturesEnabled: true,
                        polylines: Set<Polyline>.of(polylines.values),
                        onMapCreated: (GoogleMapController controller)
                        {
                          _passengerController.complete(controller);
                          newGoogleMapController = controller;

                          getPassengerPosition();
                        },
                      ),
                      //drawer button
                      SafeArea(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child:  Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              left: 10.0,
                            ),
                            child: ClipOval(
                              child: Material(
                                color: Colors.teal,
                                child: InkWell(
                                  child: const SizedBox(
                                    width: 55,
                                    height: 55,
                                    child: Icon(
                                      Icons.view_headline_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: (){
                                    Scaffold.of(context).openDrawer();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //input & output & position Buttons
                      SafeArea(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0, top: 70.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.teal, // inkwell color
                                      child: const SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      onTap: () {
                                        newGoogleMapController.animateCamera(
                                          CameraUpdate.zoomIn(),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.teal, // inkwell color
                                      child: const SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      onTap: () {
                                        newGoogleMapController.animateCamera(
                                          CameraUpdate.zoomOut(),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                ClipOval(
                                  child: Material(
                                    color: Colors.teal, // button color
                                    child: InkWell(
                                      splashColor: Colors.teal, // inkwell color
                                      child: const SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Icon(Icons.my_location, color: Colors.white,),
                                      ),
                                      onTap: () {
                                        getPassengerPosition();
                                        // on button tap
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              ),
              bottomSheet: SizedBox(
                height: 280,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 25,
                  ),
                  child: Column(
                    children:
                    [
                      const SizedBox(
                        height: 20,
                      ),
                      defaultGoogleFormField(
                        controller: startAddressController,
                        type: TextInputType.text,
                        validate: (value)
                        {
                          if(value!.isEmpty)
                            return"please enter Takeoff Station";
                        },
                        label: 'Start Station',
                        prefix: Icons.my_location,
                        onTap: (){
                          startAddressController.text = currentPassengerAddress;
                          startPassengerAddress = currentPassengerAddress;
                          navigateTo(context, BusNumberPassengerScreen());
                        },
                        focusNode: startAddressFocusNode,
                        locationCallBack: (String value){
                          setState(() {
                            startPassengerAddress = value;
                          });
                        },
                        border: const OutlineInputBorder(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultGoogleFormField(
                        controller: destinationController,
                        type: TextInputType.text,
                        validate: (value)
                        {
                          if(value!.isEmpty)
                            return "please enter Specific Destination";
                        },
                        label: 'Destination Station',
                        prefix: Icons.my_location,
                        onTap: (){
                          navigateTo(context, BusNumberPassengerScreen());
                        },
                        isBool: PassengerCubit.get(context).isDisRecording,
                        locationCallBack: (String value){
                          setState(() {
                            destinationPassengerAddress = value;
                          });
                        },
                        focusNode: destinationAddressFocusNode,
                        border: const OutlineInputBorder(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      /* Visibility(
                        visible: placePassengerDistance == null ? false : true,
                        child: Text(
                          'DISTANCE: $placePassengerDistance km',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),*/
                      const SizedBox(
                        height: 15,
                      ),
                      defaultButton(
                        width: 240,
                        function: ( startPassengerAddress != '' && destinationPassengerAddress != '')
                            ? () async{
                          startAddressFocusNode.unfocus();
                          destinationAddressFocusNode.unfocus();
                          setState(() {
                            if(markers.isNotEmpty) markers.clear();
                            if(polylines.isNotEmpty) polylines.clear();

                            if (polylineCoordinates.isNotEmpty) polylineCoordinates.clear();
                            placePassengerDistance = null;
                          });

                          calculatePassengerDistance().then((isCalculated) {
                          if(isCalculated){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Distance Calculated Successfully'),
                              ),
                            );
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(
                                content: Text(
                                    'Error Calculating Distance'),
                              ),
                            );
                          }
                          });
                        } :null,
                        text: 'Book your trip',
                        isUpperCase: false,
                        textColor: Colors.white,
                        backgroundColorBox: Colors.teal,

                      ),
                    ],
                  ),
                ),
              ), //bottomSheet:,
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}