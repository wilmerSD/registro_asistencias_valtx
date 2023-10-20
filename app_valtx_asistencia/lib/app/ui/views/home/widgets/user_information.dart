import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: kMarginApp.w),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(kRadiusMedium),
                topLeft: Radius.circular(kRadiusMedium),
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
            child: Obx(() {
              return controller.isLoadingUser.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 22,
                        child: Icon(Icons.person,
                            color: AppColors.backgroundColor, size: 30),
                      ),
                      title: Text(
                        "${controller.responseUserInformation.value.names} ${controller.responseUserInformation.value.lastNames}",
                        style: AppTextStyle(context).bold14(
                          color: AppColors.primary,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Iconsax.location,
                            color: AppColors.grayBlue,
                            size: 18.0,
                          ),
                          SizedBox(width: 5.w),
                          Flexible(
                            child: Text(
                              controller.nameLocation.value,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle(context)
                                  .medium12(color: AppColors.grayBlue),
                            ),
                          ),
                        ],
                      ),
                    );
            })));
  }
}
