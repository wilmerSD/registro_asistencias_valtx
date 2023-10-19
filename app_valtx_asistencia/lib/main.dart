import 'package:app_valtx_asistencia/core/config/app_config.dart';
import 'package:app_valtx_asistencia/core/helpers/dependency_injection.dart';
import 'package:app_valtx_asistencia/core/network/dio_config.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/routes/app_routes.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  DependencyInjection.initialize();
  AppConfig.initialize();
  DioConfig.initialize();
  DependencyInjection.initialize();
  initializeDateFormatting('es', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return ScreenUtilInit(
      /* localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ], 
        supportedLocales: const [
          Locale("es"),
        ],*/
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
      title: 'Registro de asistencia',  
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blueDark),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      
      initialRoute: AppRoutesName.SPLASH,
      getPages: AppRoutes.routes,
      
    ),
    
    );
  }
}

//   WidgetsFlutterBinding.ensureInitialized();//asegura que los widgets estén inicializados antes de ejecutar la aplicacion
//    SystemChrome.setPreferredOrientations([//orientacion de la app, solo vertical
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   AppConfig.initialize();
//   DioConfig.initialize();
//   DependencyInjection.initialize();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//    return ScreenUtilInit(
//       designSize: ScreenUtil.defaultSize,
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) => GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'VALTX',
//         theme: ThemeData(
//           fontFamily: 'Montserrat',
//           primarySwatch: Colors.red,
//         ),
//         /* localizationsDelegates: const [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//           DefaultWidgetsLocalizations.delegate,
//         ], */
//         supportedLocales: const [
//           Locale("es"),
//         ],
//         initialRoute: AppRoutesName.DETAIL,
//         getPages: AppRoutes.routes,
//         builder: (context, child) {
//           return ScrollConfiguration(
//             behavior: GlowRemover(),
//             child: child!,
//           );
//         },
//       ),
//     );
//   }
// }
// /// Remueve la burbuja al hacer scroll
// class GlowRemover extends ScrollBehavior {
//   @override
//   Widget buildViewportChrome(context, child, axisDirection) {
//     const GlowingOverscrollIndicator(
//       color: Colors.transparent,
//       axisDirection: AxisDirection.up,
//     );
//     return child;
//   }
// }
