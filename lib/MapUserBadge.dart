import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MapUserBadge extends StatefulWidget {
   MapUserBadge({
    Key? key,
  }) : super(key: key);

  @override
  State<MapUserBadge> createState() => _MapUserBadgeState();
}

class _MapUserBadgeState extends State<MapUserBadge> {
    String location ='Null, Press Button';

  String Address = 'Add Location';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

    Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.locality}, ${place.country}';
    setState(()  {
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset.zero)
          ]),
      child: Row(
        children: [
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: NetworkImage(user.photoURL!),
                      fit: BoxFit.cover),
                  border: Border.all(color: Colors.purple, width: 1))),
          SizedBox(width: 10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.displayName! ,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey)),
              Text(Address, style: TextStyle(color: Colors.purple))
            ],
          )),
          IconButton(
            icon: Icon(
              Icons.location_pin,
              color: Colors.purple,
              size: 40,
            ), onPressed: () async{
              Position position = await _getGeoLocationPosition();
              location ='Lat: ${position.latitude} , Long: ${position.longitude}';
              GetAddressFromLatLong(position);
            },
          )
        ],
      ),
    );
  }
}