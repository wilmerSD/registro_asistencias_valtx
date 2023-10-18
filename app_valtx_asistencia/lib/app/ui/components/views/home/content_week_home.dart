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
              //margin: EdgeInsets.symmetric(horizontal: kMarginApp.w),
              //height: MediaQuery.of(context).size.height * 0.03,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mis marcaciones recientes',
                    style: AppTextStyle(context).bold14(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    helpers.getWeekCurrent(),
                    style: AppTextStyle(context).bold14(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 10.0,
              ),
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                color: Colors.white,
              ),
              child: Obx(
                () {
                  return controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : controller.responseUserAssistanceWeek.isEmpty
                          ? Center(
                              child: Text('${controller.statusMessageWeek}'),
                            )
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  controller.responseUserAssistanceWeek.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 25.0);
                              },
                              itemBuilder: (context, index) {
                                final item = controller
                                    .responseUserAssistanceWeek[index];
                                Color circleColor = helpers
                                    .getCircleColor(item.idValidation ?? 0);
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: circleColor,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
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
