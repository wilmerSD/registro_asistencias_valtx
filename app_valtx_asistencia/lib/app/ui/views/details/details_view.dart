import 'package:app_valtx_asistencia/app/ui/views/details/widgets/details_day.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/widgets/details_month.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/widgets/calendar.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/widgets/date_today.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/widgets/types_validations.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: 50.h,
                elevation: 0.18,
                iconTheme: const IconThemeData(color: AppColors.primary),
                backgroundColor: AppColors.backgroundColor,
                title: Text(
                  'Mis marcaciones',
                  style: AppTextStyle(context).extra20(
                    color: AppColors.primary,
                  ),
                ),
              ),
              body: Stack(
                children: [
                  Column(
                    children: [
                      //Calendario
                      const Calendar(),
                      //Tipos de validación
                      const TypesValidations(),
                      /* SizedBox(
                        height: 10.h,
                      ), */
                      //Fecha de hoy
                      const DateToday(),
                      SizedBox(
                        height: 25.h,
                      ),
                      //Marcaciones del dia
                      const DetailsDay(),

                      //faltas o tardanzas del mes
                    ],
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: DetailslMonth(),
                  ),
                ],
              ),
            ));
  }
}
