import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailslMonth extends StatelessWidget {
  const DetailslMonth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        builder: (controller) => Column(
              children: [
                Container(
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
                ),
                const Divider(
                  color: AppColors.backgroundColor,
                  height: 3.0,
                ),
                SizedBox(
                  height: /* MediaQuery.of(context).size.height * 0.1, */ 88.h,
                  child: Obx(() {
                    return controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : controller.responseDataMes.isEmpty
                            ? Center(
                                child: Text('${controller.statusMessageMonth}',
                                    style: AppTextStyle(context).medium14(
                                      color: AppColors.grayBlue,
                                    )),
                              )
                            : ListView.separated(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.responseDataMes.length,
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 40.0.w);
                                },
                                itemBuilder: (context, index) {
                                  final itemMonth =
                                      controller.responseDataMes[index];
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        textScaleFactor: 1,
                                        '${itemMonth.quantity}',
                                        style: AppTextStyle(context).extra20(
                                          color: AppColors.primary,
                                        ),
                                        /* TextStyle(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  fontFamily: 'Montserrat'), */
                                      ),
                                      Text(
                                        textScaleFactor: 1,
                                        itemMonth.description!,
                                        style: AppTextStyle(context).medium12(
                                          color: AppColors.grayBlue,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                  }),
                ),
              ],
            ));
  }
}
