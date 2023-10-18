import 'package:app_valtx_asistencia/app/ui/components/ctn_calendar.dart';
import 'package:app_valtx_asistencia/app/ui/views/marcaciones/detail_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final helpers = Helpers();

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final ageMonth = '${helpers.getMonthName(now.month)} ${now.year}';

    return GetBuilder<DetailController>(
      builder: (controller) => Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          const CtnCalendar(),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.4,
              //height: MediaQuery.of(context).size.height * 0.03,
              decoration: BoxDecoration(
                color: AppColors.blueDark,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  ageMonth,
                  style: const TextStyle(
                    color: AppColors.backgroundColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
