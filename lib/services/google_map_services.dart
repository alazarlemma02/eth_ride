import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String googleMapKey = "AIzaSyBEctTUfraPsQ3jETULgTFBEH-ZNxwSbnQ";

class GoogleMapServices {
  late Position userCurrentPosition;
  late GoogleMapController googleMapController;
  void locateUserPostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = position;
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);

    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
