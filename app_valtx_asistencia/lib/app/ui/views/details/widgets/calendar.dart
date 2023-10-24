import 'package:app_valtx_asistencia/app/ui/views/details/widgets/ctn_calendar.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      builder: (controller) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0.w),
        height: 250.h,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              alignment: AlignmentDirectional.topCenter,
              margin: EdgeInsets.only(top: 3.h),
              width: /* MediaQuery.of(context).size.width * */ 140.w,
              height: /* MediaQuery.of(context).size.height * 0.04.h */ 24.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5.0.h),
              ),
            ),
            const CtnCalendar(),
          ],
        ),
      ),
    );
  }
}
