import 'dart:async';

import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'package:angelhack_hcm/app/shared/widgets/base/base_controller.dart';

class MapGpsController extends BaseController with GetTickerProviderStateMixin {
  //* Variables
  late AnimatedMapController? animatedMapController;
  late final dynamic args = Get.arguments;
  LatLng currentLocation = const LatLng(0, 0);

  //* Life Cycle
  @override
  void onInit() {
    super.onInit();
    onInitData();
  }

  @override
  void onClose() {
    animatedMapController?.dispose();
    super.onClose();
  }

  //* Methods
  Future<void> onInitData() async {
    animatedMapController = AnimatedMapController(vsync: this);
    currentLocation = args['currentLocation'];
  }

  Future<void> centerMapOnCurrentLocation() async {
    final currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    animatedMapController?.mapController
        .move(LatLng(currentPosition.latitude, currentPosition.longitude), 16);
  }
}
