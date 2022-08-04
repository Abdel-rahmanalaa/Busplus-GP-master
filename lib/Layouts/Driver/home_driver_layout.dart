import 'dart:async';
import 'dart:typed_data';
import 'package:busplus/Layouts/Driver/DriverCubit/driver_cubit.dart';
import 'package:busplus/Layouts/Driver/DriverCubit/driver_states.dart';
import 'package:busplus/Modules/Driver/DriverNavigatorDrawer/driver_navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DriverHomeLayout extends StatefulWidget {
  const DriverHomeLayout({Key? key}) : super(key: key);

  @override
  State<DriverHomeLayout> createState() => _DriverHomeLayoutState();
}

class _DriverHomeLayoutState extends State<DriverHomeLayout> {

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }


  StreamSubscription? _locationSubscription;
  Location _locationTracker = Location();
  Marker? marker;
  Circle? circle;
  GoogleMapController? _controller;
  Set<Polyline> pathPolyline = <Polyline>{};
  List<LatLng>lL= <LatLng>[];


  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(26.8206, 30.8025),
    zoom: 19.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/images/MarkerBus.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircleAndPath(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude!, newLocalData.longitude!);
    setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading!,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData)
      );
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy!,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
      lL.add(latlng);
      pathPolyline.add(
        Polyline(
            polylineId: PolylineId('1'),
            color: Colors.yellow,
            width: 5,
            points:lL,
            patterns: [
              PatternItem.dash(20),
              PatternItem.gap(10),
            ]

        ),
      );

    });
  }

  void getCurrentLocation() async {
    try {

      Uint8List imageData = await getMarker();

      var location = await _locationTracker.getLocation();

      updateMarkerAndCircleAndPath(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription!.cancel();
      }


      _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData) {
        if (_controller != null) {
          _controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              bearing: 90.8334901395799,
              target: LatLng(newLocalData.latitude!, newLocalData.longitude!),
              tilt: 0,
              zoom: 18.00)));
          updateMarkerAndCircleAndPath(newLocalData, imageData);
        }
      });

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriverStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return Scaffold(
          drawer: const DriverNavigationDrawerWidget(),
          body: Builder(
              builder: (context){
                return Stack(
                  children:<Widget>
                  [
                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: initialLocation,
                      markers: Set.of((marker != null) ? [marker!] : []),
                      circles: Set.of((circle != null) ? [circle!] : []),
                      polylines: pathPolyline,
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        _controller = controller;
                      },
                    ),
                    //input & output & position Buttons
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
                    SafeArea(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, top: 550),
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
                                      _controller!.animateCamera(CameraUpdate.zoomIn());
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
                                      _controller!.animateCamera(CameraUpdate.zoomOut());
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
                                      getCurrentLocation();
                                      // on button tap
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
                                      child: Icon(Icons.close, color: Colors.white,),
                                    ),
                                    onTap: () {
                                      if (_locationSubscription != null) {
                                        _locationSubscription!.cancel();
                                      }
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
        );
      },
    );
  }
}
