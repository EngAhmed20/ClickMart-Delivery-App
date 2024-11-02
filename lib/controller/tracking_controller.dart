import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class TrackingController extends GetxController{
  StreamSubscription<Position>?positionStream;
  getCurrentLocation() {
    positionStream = Geolocator.getPositionStream().listen((Position?position) {
      print("current position");
      print(position!.altitude);
      print(position!.longitude);
    });
  }
  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }

}