import 'dart:convert';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_day_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_day_user_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_validations_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  bool isFirstTime = true;
  @override
  void onInit() {
    _typesValidationsuser();
    _assistancesDayUser();
    _assistancesMonthUser();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Instances
  final _assistancesDayUserRepository = Get.find<AssistanceDayUserRepository>();

  //variables
  var responseTypesValidations = <Datum>[].obs;
  var responseDataDia = <DatumDay>[].obs;
  var responseDataMes = <DatumMonth>[].obs;
  var statusMessageDay = ''.obs;
  var statusMessageMonth = ''.obs;
  RxString messageError = RxString("");
  RxBool isLoading = false.obs;
  RxBool isVisible = false.obs;

  //Funciones
  //Tipos de validacion
  void _typesValidationsuser() async {
    isLoading.value = true;
    final storedTypesValidation =
        await StorageService.get(Keys.kTypesValidation);
    final decodedTypesValidation = json.decode(storedTypesValidation);
    final typesValidationList = (decodedTypesValidation['data'] as List)
        .map((item) => Datum.fromJson(item))
        .toList();
    responseTypesValidations.assignAll(typesValidationList);
  }

  //Asistencias del mes de usuario
  void _assistancesMonthUser() async {
    isLoading.value = true;
    final storedAssistancesMonthUser =
        await StorageService.get(Keys.kAssistancesMonthUser);
    final decodedAssistancesMonthUser = json.decode(storedAssistancesMonthUser);
    final decodedAssistancesMonthUserList =
        (decodedAssistancesMonthUser['data'] as List)
            .map((item) => DatumMonth.fromJson(item))
            .toList();
    responseDataMes.assignAll(decodedAssistancesMonthUserList);
    statusMessageMonth.value = decodedAssistancesMonthUser['status_message'];
  }

  //Asistencias del dia de usuario
  void _assistancesDayUser() async {
    isLoading.value = false;
    try {
      isLoading.value = true;
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response = await _assistancesDayUserRepository.getAssistancesDay(
        RequestIdUserModel(
          idUser: int.parse(Iduser),
        ),
      );
      isLoading.value = false;
      responseDataDia.assignAll(response.data ?? []);
      statusMessageDay.value = response.statusMessage;
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
}
