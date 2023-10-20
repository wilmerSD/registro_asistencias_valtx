import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

final helpers = Helpers();

class DateToday extends StatelessWidget {
  const DateToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate =
        '${now.day} ${helpers.getMonthName(now.month)} ${now.year}';
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      width: double.infinity,
      height: 30.0,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          formattedDate,
          style: AppTextStyle(context).bold18(
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
