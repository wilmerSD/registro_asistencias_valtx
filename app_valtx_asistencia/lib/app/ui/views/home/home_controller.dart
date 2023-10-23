import 'dart:convert';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_assistance%20_information_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_week_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_register_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_assistances_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/repositories/assistances_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_validations_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/repositories/register_marking_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_assistances_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as locations;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    await getIcons();
    await _getinformationUser();
    await _getTypesMarking();
    await _typesValidationsuser();
    await detailsControllerDate();
    await _getAssistancesMonthUser(formattedDate);
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
  var responseUserAssistance = DataMark().obs;
  var responseTypesMarking = <DatumAssistances>[].obs;
  var responseUserAssistanceWeek = <DatumWeek>[].obs;
  var responseUserAssistanceMonth = <DatumMonth>[].obs;
  RxString statusMessageTypesMarking = RxString("");
  RxString statusMessageUserInformation = RxString("");
  RxString statusMessageWeek = RxString("");
  RxString statusMessageMonth = RxString("");
  RxString statusMessageUserAssistance = RxString("");
  RxString messageError = RxString("");
  RxString nameLocation = "Obteniendo ubicación...".obs;
  LatLng workPosition = const LatLng(-12.086660314676623, -76.99120477371234);
  RxBool statusAssistance = true.obs;
  RxBool isLoading = false.obs;
  RxBool isVisible = false.obs;
  RxBool isLoadingUser = false.obs;
  double latitude = 0.0;
  double longitude = 0.0;
  DateTime? selectedDate;
  String? formattedDate;
  final Rx<LatLng> currentLocation = Rx<LatLng>(const LatLng(0, 0));
  late BitmapDescriptor iconMap = BitmapDescriptor.defaultMarker;

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
      return;
    }
  }

  //Tipos de validacion
  _typesValidationsuser() async {
    isLoading.value = true;
    final response = await _typesValidationsRepository.getTypesValidations();
    isLoading.value = false;
    if (!response.success) {
      return;
    }
    await StorageService.set(
        key: Keys.kTypesValidation, value: json.encode(response.toJson()));
  }

  //Asistencia del mes
  _getAssistancesMonthUser(formattedDate) async {
    isLoading.value = true;
    String Iduser = await StorageService.get(Keys.kIdUser);
    final response =
        await _assistancesMonthkUserRepository.getAssistancesMonthDate(
      RequestAssistanceInformationModel(
          idUser: int.parse(Iduser), date: formattedDate),
    );

    responseUserAssistanceMonth.assignAll(response.data ?? []);
    statusMessageMonth.value = response.statusMessage;
    isLoading.value = false;
    if (!response.success) {
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

      responseUserAssistanceWeek.assignAll(response.data ?? []);
      statusMessageWeek.value = response.statusMessage;
      isLoading.value = false;
      if (!response.success) {
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
    isLoading.value = true;
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response = await _registerMarkingUser.postRegisterMarking(
        RequestMarkingUserModel(
            idUser: int.parse(Iduser),
            idTypesMarking: selectedValue,
            latitude: latitude,
            longitude: longitude),
      );

      statusAssistance.value = response.success;
      statusMessageUserAssistance.value = response.statusMessage;
      responseUserAssistance.value = response.data;

      isLoading.value = false;
      if (!response.success) {
        return;
      }
      _getAssistancesMonthUser(formattedDate);
      _getAssistancesWeekhUser();
    } catch (error) {
      isVisible.value = true;
      messageError.value =
          'Ha ocurrido un error, por favor inténtelo de nuevo mas tarde';
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: messageError.value,
      );
    }
  }

  //Chequear los permisos de ubicación
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

  //Optener ubicación actual
  Future<void> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLocation.value = LatLng(position.latitude,
        position.longitude); // -12.086660314676623,-76.99120477371234
    latitude = position.latitude;
    longitude = position.longitude;
    update();
  }

  //Optener nombre de ubicación actual
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

  //loginout
  loginout() async {
    await StorageService.deleteAll();
    Get.offNamed(AppRoutesName.LOGIN);
  }

  // cargar icono para el mapa
  getIcons() async {
    iconMap = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        "assets/markerValtx.png");
    update();
  }

  //Ir a detalles
  navigateToScreen() {
    Get.toNamed(AppRoutesName.DETAIL);
  }

  // Guardando fecha en formato correcto
  detailsControllerDate() {
    selectedDate = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
  }
}
