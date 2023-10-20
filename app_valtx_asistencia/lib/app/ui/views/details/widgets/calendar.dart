import 'package:app_valtx_asistencia/app/ui/components/ctn_calendar.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      builder: (controller) => Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 3),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.04,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          const CtnCalendar(),
        ],
      ),
    );
  }
}
