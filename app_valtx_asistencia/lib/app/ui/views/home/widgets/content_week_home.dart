import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final helpers = Helpers();

class ContentWeekHome extends StatelessWidget {
  const ContentWeekHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final helpers = Helpers();
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        height: 76.h,
        margin: EdgeInsets.symmetric(horizontal: kMarginApp.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.grayBlue.withOpacity(0.1),
              spreadRadius: 4,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 8.h, right: 15.w, left: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0.w),
                  topLeft: Radius.circular(10.0.w),
                ),
                color: AppColors.backgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    textScaleFactor: 1,
                    'Mis marcaciones recientes',
                    style: /* AppTextStyle(context).bold14(
                      color: AppColors.primary,
                    ), */
                        TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Montserrat'),
                  ),
                  Text(
                    textScaleFactor: 1,
                    helpers.getWeekCurrent(),
                    style: AppTextStyle(context).bold14(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 43.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(kRadiusMedium),
                  bottomRight: Radius.circular(kRadiusMedium),
                ),
                color: AppColors.backgroundColor,
              ),
              child: Obx(
                () {
                  return controller.isLoading.value
                      ? Center(
                          child: SizedBox(
                              height: 20.0.h,
                              width: 20.0.w,
                              child: CircularProgressIndicator(value: 1.h)))
                      : controller.responseUserAssistanceWeek.isEmpty
                          ? Center(
                              child: Text('${controller.statusMessageWeek}',
                                  style: AppTextStyle(context).medium12(
                                    color: AppColors.grayBlue,
                                  )),
                            )
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  controller.responseUserAssistanceWeek.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 33.0.w);
                              },
                              itemBuilder: (context, index) {
                                final item = controller
                                    .responseUserAssistanceWeek[index];
                                Color circleColor = helpers
                                    .getCircleColor(item.idValidation ?? 0);
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                        radius: 10.h,
                                        backgroundColor: circleColor,
                                      ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      textScaleFactor: 1,
                                      item.day ?? '',
                                      style: AppTextStyle(context)
                                          .normal12(color: AppColors.grayBlue),
                                    ),
                                  ],
                                );
                              },
                            );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
