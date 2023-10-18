import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BtnMarcar extends StatelessWidget {
  const BtnMarcar({
    Key? key,
    required this.OnTap,
    required this.title,
  }) : super(key: key);

  final void Function() OnTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        margin:const EdgeInsets.only(left: 10.0,right: 10.0),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration:const BoxDecoration(
            gradient:   LinearGradient(
                        colors: [
                          AppColors.degradedInitial,
                          AppColors.degradedEnd,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color:  AppColors.degradedInitial,
                blurRadius: 5.0,
                offset: Offset(0, 3),
                spreadRadius: 0.0,
              ),
            ]),
        child: Text(
          title,
          style:const TextStyle(
              fontSize: 18.0, color: AppColors.backgroundColor),
        ),
      ),
    );
  }
}
