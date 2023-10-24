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
                toolbarHeight: /* MediaQuery.of(context).size.height * 0.08, */
                    70.h,
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
              body: const Stack(children: [
                Column(
                  /*  mainAxisAlignment: MainAxisAlignment.spaceAround, */
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Calendario
                    Calendar(),
                    //Tipos de validación
                    TypesValidations(),
                    SizedBox(height: 10,),
                    //Fecha de hoy
                    DateToday(),
                    SizedBox(height: 20,),
                    //Marcaciones del dia
                    DetailsDay(),
                    //faltas o tardanzas del mes
                    DetailslMonth(),
                  ],
                ),
              ]),
            ));
  }
}
