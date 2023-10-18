import 'package:app_valtx_asistencia/app/ui/components/alerts/alt_error.dart';
import 'package:app_valtx_asistencia/app/ui/components/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_valtx_asistencia/app/ui/components/dashed_line.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/content_week_home.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/appBar_home.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/bottom_home.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/map_view.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/home/user_information.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/widgets/drawer_menu_app.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        drawer: const DrawerMenuApp(),
        body: Stack(
          children: [
            const MapView(),
            Column(
              children: [
                //Detalles
                const AppBarHome(),
                Expanded(child: Container()),
                //Asistencias de la semana
                const ContentWeekHome(),
                SizedBox(height: 15.h),
                //Información del usuario
                const UserInformation(),
                DashedLine(
                  dashWidth: 5.0,
                  dashGap: 5.0,
                  color: AppColors.grayBlue,
                  width: double.infinity,
                  height: 1.0,
                  margin: EdgeInsets.symmetric(horizontal: kMarginApp.w),
                ),
                const BottomHome(),
                //Para marcar asistencia
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kMarginApp.w),
                  child: BtnPrimaryInk(
                    text: controller.isLoading.value
                        ? "Verificando..."
                        : "Marcar",
                    loading: controller.isLoading.value,
                    onTap: () {
                      helpers.showTypesMarkingDialog(context, controller);
                      controller.getCurrentLocation();
                      controller.getNameLocation();
                    },
                  ),
                ),
                /* BtnMarcar(
									OnTap: () {
										helpers.showTypesMarkingDialog(context, controller);
										controller.getCurrentLocation();
										controller.getNameLocation();
									},
									title: 'Marcar',
								), */
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
