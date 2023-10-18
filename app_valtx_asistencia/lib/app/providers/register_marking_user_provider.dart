import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_register_marking_user_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class RegisterMarkingUserProvider {
	final _dioClient = Get.find<DioClient>();

	Future<ResponseRegisterMarkingUserModel> postRegisterMarking(
		RequestMarkingUserModel request,
	) async {
		final response = await _dioClient.post(
			path: "/api/assistance/marking",
			bodyRaw: request.toMap(),
		);
		return ResponseRegisterMarkingUserModel.fromJson(response);
	}
}
