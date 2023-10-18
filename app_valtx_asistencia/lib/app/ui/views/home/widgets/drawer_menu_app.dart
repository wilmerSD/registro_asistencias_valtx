import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
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
          horizontal: 20.w,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 30.0,
              ),
              SizedBox(height: 15.h),
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
              SizedBox(height: 15.h),
              const Divider(color: AppColors.grayLight),
              SizedBox(height: 15.h),
              ListTile(
                onTap: () => controller.navigateToScreen(),
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Iconsax.calendar,
                  size: 18.0,
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
                leading: const Icon(
                  Iconsax.logout,
                  size: 18.0,
                  color: AppColors.primary,
                ),
                title: Text(
                  "Cerrar sesión",
                  style: AppTextStyle(context).medium14(
                    color: AppColors.primary,
                  ),
                ),
              ),

              /* Expanded(
								child: SizedBox(
									width: double.infinity,
									child: DrawerHeader(
										decoration: const BoxDecoration(
											border: Border(
												bottom: BorderSide(
													color: AppColors.black,
													width: 0.1,
												),
											),
										),
										child: Column(
											children: [
												CircleAvatar(
													radius: 25.r,
													/* backgroundImage:
														const AssetImage("assets/icons/avatar.png"), */
												),
												Text(
													"Hola,",
													/* style: Theme.of(context)
														.textTheme
														.headline6
														?.copyWith(
															color: AppTheme.kTitle,
															fontWeight: FontWeight.bold), */
												),
												SizedBox(height: 5.h),
												/* Obx(
													() => Text(
														"${_.nameUser}",
														style: Theme.of(context)
															.textTheme
															.caption
															?.copyWith(color: AppTheme.kMidlleTitle),
													),
													), */
											],
										),
									),
								),
								),
								Expanded(
									flex: 3,
									child: Column(
										children: [

										],
									)
								), */
            ],
          ),
        ),
      ),
    );
  }
}
