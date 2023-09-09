import 'dart:async';
// import 'dart:developer';
// import 'dart:developer';
// import 'dart:js_interop';

import 'package:blood_bank/constants/colors.dart';
// import 'package:blood_bank/services/location_services.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  // static LocationData? myLocation;
  // LocationService locationService = LocationService();
  // String? error;
  @override
  void initState() {
    super.initState();
    // getLocation();
  }

  // getLocation() async {
  //   try {
  //     myLocation = await locationService.getMyLocation();
  //   } catch (e) {
  //     error = e.toString();
  //   }
  // }

  // static LocationData myLocation = getLocation();
  // static Position mylocation = LocationService._determinePosition();

  // LocationService locationService = LocationService();
  // static Position? myLocation;
  // static late LatLng myloc;

  // getLocation() async {
  //   myLocation = await locationService.determinePosition();
  //   final double mylat = myLocation!.latitude;
  //   final double mylng = myLocation!.longitude;
  //   setState(() {
  //     myloc = LatLng(mylat, mylng);
  //   });
  //   log("$mylat || $mylng");
  // }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _myLocation = CameraPosition(
    // target: myloc,
    target: LatLng(	6.4863774407, 3.5908679661),
    zoom: 14.4746,
  );

  static const CameraPosition _hospitalLocation = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(6.42831032996754, 3.4084553272151044),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  // my location
  static final Marker _myLocationMarker = Marker(
    markerId: const MarkerId("_myLocationMarker"),
    infoWindow: const InfoWindow(title: "My Location"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: _myLocation.target,
  );
  // hospital location
  static final Marker _hospitalLocationMarker = Marker(
    markerId: const MarkerId("_hospitalLocationMarker"),
    icon: BitmapDescriptor.defaultMarker,
    position: _hospitalLocation.target,
  );
  static final Polyline _polyline = Polyline(
    polylineId: PolylineId("_polyline"),
    points: [
      _myLocation.target,
      _hospitalLocation.target,
    ],
    width: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("OUR LOCATION"),
        elevation: 0,
        centerTitle: true,
      ),
      body: GoogleMap(
        markers: {_myLocationMarker, _hospitalLocationMarker},
        polylines: {
          _polyline,
        },
        mapType: MapType.hybrid,
        initialCameraPosition: _myLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        // onPressed: _goToTheLake,
        onPressed: () {},
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(_hospitalLocation));
  // }
}
