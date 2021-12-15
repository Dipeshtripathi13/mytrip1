import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../MapUserBadge.dart';


const LatLng SOURCE_Location = LatLng(42.7477863, -71.1699932);
const LatLng DEST_Location = LatLng(42.743982, -71.170009);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);
  static const String id = 'map';

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();

  late LatLng currentLocation;
  late LatLng destinationLocation;

  @override
  void initState() {
    super.initState();
    // set up the initial location
    this.setInitialLocation();

    // set up the marker icons
    this.setSourceAndDestinationMarkersIcons();
  }

  void setSourceAndDestinationMarkersIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'images/source_pin.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'images/destination_pin.png');
  }

  void setInitialLocation() {
    currentLocation =
        LatLng(SOURCE_Location.latitude, SOURCE_Location.longitude);

    destinationLocation =
        LatLng(DEST_Location.latitude, DEST_Location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_Location);

    return Scaffold(
        //Stack is used to make map in backgroung so that we can add any layers over the map.
        body: Stack(
      children: [
        Positioned.fill(
            child: GoogleMap(
                myLocationEnabled: true,
                compassEnabled: false,
                tiltGesturesEnabled: false,
                markers: _markers,
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);

                  showPinsOnMap();
                })),

        // the below mentioned code is for user current location with the overlay of avatar
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: MapUserBadge(),
        )
      ],
    ));
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: currentLocation,
          icon: sourceIcon));

      _markers.add(Marker(
          markerId: MarkerId('destinationPin'),
          position: destinationLocation,
          icon: destinationIcon));
    });
  }
}