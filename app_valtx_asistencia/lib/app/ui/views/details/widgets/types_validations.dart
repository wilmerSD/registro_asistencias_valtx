import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final helpers = Helpers();

class TypesValidations extends StatelessWidget {
  const TypesValidations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        height: MediaQuery.of(context).size.height * 0.07,
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.responseTypesValidations.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 45.0);
                  },
                  itemBuilder: (context, index) {
                    final item = controller.responseTypesValidations[index];
                    Color circleColor =
                        helpers.getCircleColor(item.idValidation);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: circleColor,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          item.description,
                          style: AppTextStyle(context).medium14(
                            color: AppColors.grayBlue,
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
