import 'dart:convert';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_day_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_day_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/repositories/asisstances_day_user_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_validations_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsController extends GetxController {
  
  @override
  void onInit()async {
    await detailsControllerDate();
    _typesValidationsuser();
    assistancesDayUser(formattedDate);
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
  var date = ''.obs;
  RxString messageError = RxString("");
  RxBool isLoading = false.obs;
  RxBool isVisible = false.obs;
  DateTime? selectedDate;
  String? formattedDate;

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

  //Formatear la hora
  detailsControllerDate() {
    selectedDate = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
  }

  //Asistencias del dia de usuario
  void assistancesDayUser(formattedDate) async {
    isLoading.value = false;
    try {
      isLoading.value = true;
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response = await _assistancesDayUserRepository.getAssistancesDay(
        RequestDayInformationModel(
          idUser: int.parse(Iduser),
          date: formattedDate,
        ),
      );
      
      isLoading.value = false;
      responseDataDia.assignAll(response.data ?? []);
      statusMessageDay.value = response.statusMessage;
      if (!response.success) {
        
        return;
      }
     } catch (error) {
      isVisible.value = true;
        Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: "Ups! Ocurrió un error, por favor inténtelo de nuevo más tarde.",
      );
      
    }
  }
}
