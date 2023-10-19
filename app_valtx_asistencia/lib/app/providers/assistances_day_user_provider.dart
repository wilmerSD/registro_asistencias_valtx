import 'package:app_valtx_asistencia/app/models/request/request_day_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_day_user_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class AssistanceDayUserProvider {
  final _dioClient = Get.find<DioClient>();

  Future<ResponseAssistancesDayUserModel> getAssistancesDay(
    RequestDayInformationModel request,
  ) async {
    final response = await _dioClient.get(
      path: "/api/user/markingDay",
      bodyRaw: request.toMap(),
    );
    return ResponseAssistancesDayUserModel.fromJson(response);
  }
}
