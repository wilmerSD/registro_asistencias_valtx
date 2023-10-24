import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final helpers = Helpers();

class DetailsDay extends StatelessWidget {
  const DetailsDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        builder: (controller) => Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0.w),
              height: /* MediaQuery.of(context).size.height * 0.28 */ 190.h,
              child: Obx(() {
                return controller.isVisibleDay.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.responseDataDia.isEmpty
                        ? Center(
                            child: Text('${controller.statusMessageDay}',
                                style: AppTextStyle(context).medium14(
                                  color: AppColors.grayBlue,
                                )),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  padding: EdgeInsets.only(top: 10.h),
                                  itemCount: controller.responseDataDia.length,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 20.0.h);
                                  },
                                  itemBuilder: (context, index) {
                                    final itemDay =
                                        controller.responseDataDia[index];
                                    Color circleColordia = helpers
                                        .getCircleColor(itemDay.idValidation!);
                                    return Row(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 20.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: circleColordia,
                                              ),
                                            ),
                                            SizedBox(width: 15.0.w),
                                            Text(
                                              textScaleFactor: 1,
                                              itemDay.time ?? '',
                                              style:
                                                  AppTextStyle(context).extra14(
                                                color: AppColors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 20.0.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              textScaleFactor: 1,
                                              itemDay.typesMarking!,
                                              style:
                                                  AppTextStyle(context).bold14(
                                                color: AppColors.primary,
                                              ),
                                            ),
                                            Text(
                                              textScaleFactor: 1,
                                              'Sin observaciones',
                                              style: AppTextStyle(context)
                                                  .medium14(
                                                color: AppColors.grey,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                              )
                            ],
                          );
              }),
            ));
  }
}
