import 'package:app_valtx_asistencia/app/ui/components/alerts/alt_error.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/details/assistance_day_user.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/details/bottomDetail.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/details/calendar.dart';
import 'package:app_valtx_asistencia/app/ui/components/date_today.dart';
import 'package:app_valtx_asistencia/app/ui/components/views/details/types_validations.dart';
import 'package:app_valtx_asistencia/app/ui/views/marcaciones/detail_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height * 0.08,
                elevation: 0.18,
                iconTheme: const IconThemeData(color: AppColors.primary),
                backgroundColor: AppColors.backgroundColor,
                title: Text(
                  'Mis marcaciones',
                  style: AppTextStyle(context).bold18(
                    color: AppColors.primary,
                  ),
                ),
              ),
              body: Stack(children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Calendario
                    Calendar(),
                    //Tipos de validación
                    TypesValidations(),
                    //Fecha de hoy
                    DateToday(),
                    //Marcaciones del dia
                    AssistanceDayUser(),
                    //faltas o tardanzas del mes
                    BottomDetail(),
                  ],
                ),
                Obx(
                  () => AltError(
                      textError: controller.messageError.value,
                      isVisible: controller.isVisible.value,
                      isLoading: false,
                      OnTap: () {
                        controller.messageError.value = "";
                        controller.isVisible.value = false;
                      }),
                )
              ]),
            ));
  }
}
