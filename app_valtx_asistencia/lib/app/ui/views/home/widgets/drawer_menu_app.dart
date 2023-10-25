import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DrawerMenuApp extends GetView<HomeController> {
  const DrawerMenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kPaddingAppLargeApp.w,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: kRadiusLarge.h,
              ),
              SizedBox(height: kSize.h),
              Text(
                "Hola,",
                style: AppTextStyle(context).bold14(
                  color: AppColors.primary,
                ),
              ),
              Obx(
                () => Text(
                  "${controller.responseUserInformation.value.names} ${controller.responseUserInformation.value.lastNames}",
                  style: AppTextStyle(context).bold18(
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: kSize.h),
              const Divider(color: AppColors.grayLight),
              SizedBox(height: kSize.h),
              ListTile(
                onTap: () => controller.navigateToScreen(),
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Iconsax.calendar,
                  size: kIconSizeSmall.h,
                  color: AppColors.primary,
                ),
                title: Text(
                  "Mis marcaciones",
                  style: AppTextStyle(context).medium14(
                    color: AppColors.primary,
                  ),
                ),
              ),
              const Spacer(),
              ListTile(
                onTap: () => controller.loginout(),
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Iconsax.logout,
                  size: kIconSizeSmall.h,
                  color: AppColors.primary,
                ),
                title: Text(
                  "Cerrar sesión",
                  style: AppTextStyle(context).medium14(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
