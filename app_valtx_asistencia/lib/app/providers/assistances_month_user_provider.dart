import 'package:app_valtx_asistencia/app/models/request/request_assistance%20_information_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';
class AssistanceMonthUserProvider {
	final _dioClient = Get.find<DioClient>();

	Future<ResponseAssistancesMonthUserModel> getAssistancesMonth(
		RequestIdUserModel request,
	) async {
		final response = await _dioClient.get(
			path: "/api/user/markingMonth",
			bodyRaw: request.toMap(),
		);
		return ResponseAssistancesMonthUserModel.fromJson(response);
	}

  Future<ResponseAssistancesMonthUserModel> getAssistancesMonthDate(
		RequestAssistanceInformationModel request,
	) async {
		final response = await _dioClient.get(
			path: "/api/user/markingMonth",
			bodyRaw: request.toMap(),
		);
		return ResponseAssistancesMonthUserModel.fromJson(response);
	}
}
