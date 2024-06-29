import 'dart:async';

import 'package:flutter/material.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'package:angelhack_hcm/app/routes/app_pages.dart';
import 'package:angelhack_hcm/app/shared/utils/ui_utils.dart';
import 'package:angelhack_hcm/app/shared/widgets/base/base_controller.dart';
import 'package:angelhack_hcm/app/shared/widgets/utils/custom_dialog.dart';

class MapGpsController extends BaseController with GetTickerProviderStateMixin {
  //* Variables
  late AnimatedMapController? animatedMapController;
  RxBool showAppbar = true.obs;

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

  Future<void> onLogout() async {
    await Get.dialog(
      CustomDialog(
        title: localeLang.logout,
        subtitle: localeLang.beforeLogout,
        buttonText: localeLang.logout,
        buttonColor: Theme.of(gContext).colorScheme.error,
        isButtonBold: true,
        onTap: () async {
          final result = await Amplify.Auth.signOut();
          if (result is CognitoCompleteSignOut) {
            await Get.offAllNamed(Routes.SPLASH);
          } else if (result is CognitoFailedSignOut) {
            safePrint('Error signing user out: ${result.exception.message}');
          }
        },
      ),
    );
  }
}
