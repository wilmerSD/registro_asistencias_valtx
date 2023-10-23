import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final helpers = Helpers();
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        margin: EdgeInsets.symmetric(horizontal: kMarginApp.w, vertical: 40.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50.h,
                  /* height: MediaQuery.of(context).size.height * 0.08, */
                  //width: MediaQuery.of(context).size.width * 0.15,
                  /* margin: const EdgeInsets.only(top: 40.0), */
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
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
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    /* onPressed: () {
                      controller.navigateToScreen();
                    }, */
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Container(
                  height: 50.h,
                  //height: MediaQuery.of(context).size.height * 0.068,
                  //width: MediaQuery.of(context).size.width * 0.68,
                  padding: EdgeInsets.only(
                    top: 8.0.h,
                    bottom: 8.0.h,
                    left: 20.0.h,
                    right: 20.0.h,
                  ),
                  /* margin: const EdgeInsets.only(top: 40.0), */
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
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
                  child: Row(
                    children: [
                      const Text(
                        textScaleFactor: 1,
                        'Valtx',
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(width: 20.w),
                      Text(
                        textScaleFactor: 1.2,
                        helpers.getDateLarge(),
                        style: AppTextStyle(context)
                            .medium12(color: AppColors.grayBlue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
