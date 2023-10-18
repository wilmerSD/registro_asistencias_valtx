import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_week_user_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';
class AssistanceWeekUserProvider {
	final _dioClient = Get.find<DioClient>();

	Future<ResponseAssistancesWeekUserModel> getAssistancesWeek(
		RequestIdUserModel request,
	) async {
		final response = await _dioClient.get(
			path: "/api/user/markingWeek",
			bodyRaw: request.toMap(),
		);
		return ResponseAssistancesWeekUserModel.fromJson(response);
	}

}
