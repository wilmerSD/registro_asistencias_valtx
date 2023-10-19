import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomHome extends StatelessWidget {
  const BottomHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
              //height: MediaQuery.of(context).size.height * 0.11,
              margin: EdgeInsets.only(
                left: kMarginApp.w,
                right: kMarginApp.w,
                bottom: 20.0,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                color: AppColors.backgroundColor,
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
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Obx(
                      () {
                        return controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : controller.responseUserAssistanceMonth.isEmpty
                                ? Center(
                                    child: Text(
                                        '${controller.statusMessageMonth}',
                                        style: AppTextStyle(context).medium14(
                                          color: AppColors.grayBlue,
                                        )),
                                  )
                                : ListView.separated(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller
                                        .responseUserAssistanceMonth.length,
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(width: 95.0);
                                    },
                                    itemBuilder: (context, index) {
                                      final itemMonth = controller
                                          .responseUserAssistanceMonth[index];
                                      /* Color circleColor =
                                      getCircleColor(itemMonth.idValidation ?? 0); */
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${itemMonth.quantity}',
                                            style: const TextStyle(
                                              color: AppColors.blueDark,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            itemMonth.description!,
                                            style: AppTextStyle(context)
                                                .normal12(
                                                    color: AppColors.grayBlue),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
