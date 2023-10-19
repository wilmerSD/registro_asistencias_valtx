import 'dart:convert';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_week_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_register_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_assistances_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/repositories/types_validations_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_month_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_week_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/register_marking_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_assistances_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as locations;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    await _getinformationUser();
    await _getTypesMarking();
    await _typesValidationsuser();
    await _getAssistancesMonthUser();
    await _getAssistancesWeekhUser();
    await _checkLocationPermission();
    await getCurrentLocation();
    await getNameLocation();
    super.onInit();
    update();
  }

  @override
  void onReady() async {
    /* update(); */
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Instance
  locations.Location location = locations.Location();
  locations.LocationData? locationData;
  final _userRepository = Get.find<UserRepository>();
  final _assistancesWeekUserRepository =
      Get.find<AssistanceWeekUserRepository>();
  final _assistancesMonthkUserRepository =
      Get.find<AssistanceMonthUserRepository>();
  final _registerMarkingUser = Get.find<RegisterMarkingUserRepository>();
  final _typesAssistances = Get.find<TypesAssistancesUserRepository>();
  final _typesValidationsRepository = Get.find<TypesValidationsRepository>();

  //Variables
  var responseUserInformation = DataUser().obs;
  var responseTypesMarking = <DatumAssistances>[].obs;
  var statusMessageTypesMarking = ''.obs;
  var statusMessageUserInformation = ''.obs;
  var statusMessageWeek = ''.obs;
  var statusMessageMonth = ''.obs;
  var statusAssistance = true.obs;
  var responseUserAssistanceWeek = <DatumWeek>[].obs;
  var responseUserAssistanceMonth = <DatumMonth>[].obs;
  var responseUserAssistance = DataMark().obs;
  var responseAssistance = ''.obs;
  var statusMessageUserAssistance = ''.obs;
  final Rx<LatLng> currentLocation = Rx<LatLng>(const LatLng(0, 0));
  RxBool isLoading = false.obs;
  RxString messageError = RxString("");
  RxBool isVisible = false.obs;
  RxBool isLoadingUser = false.obs;
  double latitude = 0.0;
  double longitude = 0.0;
  RxString nameLocation = "Obteniendo ubicación...".obs;

  //Functions
  //traer información del usuario
  _getinformationUser() async {
    isLoadingUser.value = true;
    final response = await _userRepository.getUserInformation(
      RequestUserInformationModel(
        username: await StorageService.get(Keys.kUserName),
        password: await StorageService.get(Keys.kPassword),
      ),
    );
    isLoadingUser.value = false;
    responseUserInformation.value = response.data;
    statusMessageUserInformation.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
    final idUser = response.data.idUser;
    await StorageService.set(key: Keys.kIdUser, value: idUser.toString());
  }

  //tipos de marcación
  _getTypesMarking() async {
    isLoading.value = true;
    final response = await _typesAssistances.getTypesAssistances();
    isLoading.value = false;
    responseTypesMarking.assignAll(response.data);
    statusMessageTypesMarking.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  //Tipos de validacion
  _typesValidationsuser() async {
    isLoading.value = true;
    final response = await _typesValidationsRepository.getTypesValidations();
    isLoading.value = false;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
    await StorageService.set(
        key: Keys.kTypesValidation, value: json.encode(response.toJson()));
  }

  //Asistencia del mes
  _getAssistancesMonthUser() async {
    isLoading.value = true;
    String Iduser = await StorageService.get(Keys.kIdUser);
    final response = await _assistancesMonthkUserRepository.getAssistancesMonth(
      RequestIdUserModel(
        idUser: int.parse(Iduser),
      ),
    );
    isLoading.value = false;
    await StorageService.set(
        key: Keys.kAssistancesMonthUser, value: json.encode(response.toJson()));
    final storedAssistancesMonthUser =
        await StorageService.get(Keys.kAssistancesMonthUser);
    final decodedAssistancesMonthUser = json.decode(storedAssistancesMonthUser);
    final decodedAssistancesMonthUserList =
        (decodedAssistancesMonthUser['data'] as List)
            .map((item) => DatumMonth.fromJson(item))
            .toList();
    responseUserAssistanceMonth.assignAll(decodedAssistancesMonthUserList);
    statusMessageMonth.value = decodedAssistancesMonthUser['status_message'];
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  //Asistencia de la semana
  _getAssistancesWeekhUser() async {
    isLoading.value = true;
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      isLoading.value = true;
      final response = await _assistancesWeekUserRepository.getAssistancesWeek(
        RequestIdUserModel(
          idUser: int.parse(Iduser),
        ),
      );
      isLoading.value = false;
      responseUserAssistanceWeek.assignAll(response.data ?? []);
      statusMessageWeek.value = response.statusMessage;
      if (!response.success) {
        print("error: ${response.statusMessage}");
        return;
      }
    } catch (error) {
      isLoading.value = false;
      isVisible.value = true;
      messageError.value =
          'Ha ocurrido un error, por favor inténtelo de nuevo mas tarde';
    }
  }

  //Registrar asistencia
  assistMarker(int selectedValue) async {
    try {
      isLoading.value = true;
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response = await _registerMarkingUser.postRegisterMarking(
        RequestMarkingUserModel(
            idUser: int.parse(Iduser),
            idTypesMarking: selectedValue,
            latitude: latitude,
            longitude: longitude),
      );
      isLoading.value = false;
      statusAssistance.value = response.success;
      statusMessageUserAssistance.value = response.statusMessage;
      responseUserAssistance.value = response.data;
      if (!response.success) {
        print("error: ${response.statusMessage}");
        return;
      }
      _getAssistancesMonthUser();
      _getAssistancesWeekhUser();
    } catch (error) {
      isLoading.value = false;
      isVisible.value = true;
      messageError.value =
          'Ha ocurrido un error, por favor inténtelo de nuevo mas tarde';
    }
  }

  Future<void> _checkLocationPermission() async {
    final hasPermission = await location.hasPermission();
    if (hasPermission == locations.PermissionStatus.denied) {
      final requestPermission = await location.requestPermission();
      if (requestPermission != locations.PermissionStatus.granted) {
        //ha denegado los permisos de ubicación.
        // mensaje de error o solicitar permisos nuevamente.
        return;
      }
    }
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLocation.value = LatLng(position.latitude, position.longitude);
    latitude = position.latitude;
    longitude = position.longitude;
    update();
  }

  void navigateToScreen() {
    Get.toNamed(AppRoutesName.DETAIL);
  }

  getNameLocation() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      String streetName = placemark.street ?? '';
      nameLocation.value = streetName;
    } else {
      nameLocation.value = "Ubicación no encontrada";
    }
  }

  loginout() async {
    await StorageService.deleteAll();
    Get.offNamed(AppRoutesName.LOGIN);
  }
}
