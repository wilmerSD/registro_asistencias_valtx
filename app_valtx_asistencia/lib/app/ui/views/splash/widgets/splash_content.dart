import 'package:app_valtx_asistencia/app/ui/views/splash/splash_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              decoration: const BoxDecoration(color: AppColors.light),
              child: const Center(
                  /*child: TextLogin(
                      text: "VALTX",
                      size: 46.0,
                      colors: AppColors.blueDark,
                      alignment: TextAlign.center),*/
                  ),
            ));
  }
}
