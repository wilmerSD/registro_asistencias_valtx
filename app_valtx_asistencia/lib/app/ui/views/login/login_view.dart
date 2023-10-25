import 'package:app_valtx_asistencia/app/ui/components/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/widgets/form_login.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
                  height: kSizeBigAmple.h,
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
                      /*  Expanded(child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.contentNotification,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: kMarginLittleApp.w,
                                        vertical: kMarginLittleApp.h),
                                    height: kSizeBigLittle.h,
                                    width: kSizeBigLittle.h,
                                    child: Image.asset('assets/whatsapp.png'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: kSizeLittle.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  /* controller.launchWhatsApp(); */
                                },
                                child: const Text(
                                  '¿Necesitas ayuda?',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text("versión: 1.0.0 ")
                        ],
                      ),
                      SizedBox(
                        height: kSizeSmallLittle.h,
                      ) */
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
