import 'package:flutter/material.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:angelhack_hcm/app/shared/utils/ui_utils.dart';
import 'package:angelhack_hcm/app/shared/widgets/base/base_silver_view.dart';

import '../components/map_gps_component.dart';
import '../controllers/map_gps_controller.dart';

class MapGpsView extends BaseSilverView<MapGpsController> {
  const MapGpsView({super.key});

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: controller.animatedMapController?.mapController,
        options: MapOptions(
          initialCenter: controller.currentLocation,
          initialZoom: 16,
          minZoom: 0,
          maxZoom: 19,
          keepAlive: true,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.hcm.angelhack',
            tileProvider: CancellableNetworkTileProvider(),
            maxZoom: 18,
          ),
          CurrentLocationLayer(
            style: LocationMarkerStyle(
              marker: DefaultLocationMarker(
                child: Icon(
                  FluentIcons.person_20_filled,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 18.sp,
                ),
              ),
              markerSize: const Size(32, 32),
              showHeadingSector: false,
              accuracyCircleColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
        ],
      ),
      floatingActionButton: SeparatedColumn(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        separator: const Gap(8),
        children: [
          FloatingActionButton(
            onPressed: () async => controller.animatedMapController?.animateTo(
              dest: controller.currentLocation,
              rotation: 0,
              zoom: 16,
            ),
            tooltip: localeLang.currentLocation,
            child: Icon(
              FluentIcons.my_location_20_regular,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
