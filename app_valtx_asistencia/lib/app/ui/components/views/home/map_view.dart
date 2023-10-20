import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

GoogleMapController? mapController;
void _onMapCreated(GoogleMapController controller) {
  //controller.setMapStyle(AppColors.mapStyles);
  mapController = controller;
}

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Obx(
        () {
          mapController?.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: controller.currentLocation.value,
                zoom: 18.0,
              ),
            ),
          );
          return GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: false,
            indoorViewEnabled: true,
            compassEnabled: false,
            //tiltGesturesEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: controller.currentLocation.value,
              zoom: 18.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('current_location'),
                position: controller.currentLocation.value,
              ),
              Marker(
                markerId: const MarkerId("lugarEspecifico"),
                position: const LatLng(-12.086887197263105, -76.99128583985772),
                infoWindow: const InfoWindow(title: "Trabajo"),
                icon: controller.iconMap,
              ),
            },
            circles: {
              const Circle(
                circleId: CircleId("circuloLugarEspecifico"),
                center: LatLng(-12.086660314676623, -76.99120477371234),
                radius: 100,
                fillColor: AppColors.radiusMap,
                strokeColor: AppColors.blueDark,
                strokeWidth: 2,
              ),
            },
          );
        },
      ),
    );
  }
}
