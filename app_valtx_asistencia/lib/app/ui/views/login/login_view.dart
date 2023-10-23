import 'package:app_valtx_asistencia/app/ui/components/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/widgets/form_login.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print('prrint:$screenHeight dddd $screenWidth');
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/reunion.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text('Valtx',
                      style: AppTextStyle(context)
                          .extra40(color: AppColors.backgroundColor),
                      textAlign: TextAlign.center)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kMarginLargeApp),
                  width: double.infinity,
                  height: /* MediaQuery.of(context).size.height * 0.50, */
                      489.h,
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kRadiusNormal),
                      topRight: Radius.circular(kRadiusNormal),
                    ),
                  ),
                  child: Column(
                    children: [
                      const FormLogin(),
                      SizedBox(height: 33.h),
                      Obx(
                        () => BtnPrimaryInk(
                          text: controller.isLoading.value
                              ? "Verificando..."
                              : "Iniciar Sesión",
                          loading: controller.isLoading.value,
                          onTap: () => controller.validateForm(context),
                        ),
                      ),
                    ],
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
