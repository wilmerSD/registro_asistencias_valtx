import 'package:app_valtx_asistencia/app/ui/views/home/home_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/details_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/details_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/splash/splash_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/splash/splash_view.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:get/get.dart';


abstract class AppRoutes {
  static final routes = [
    GetPage(
      name: AppRoutesName.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutesName.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutesName.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: AppRoutesName.LOGIN,
      page: () => const LoginView(),
      binding: LoginBiding(),
    ),
  ];
}
