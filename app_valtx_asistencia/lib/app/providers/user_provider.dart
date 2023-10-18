import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';
class UserProvider {
	final _dioClient = Get.find<DioClient>();

	Future<ResponseUserInformationModel> getUserInformation(
		RequestUserInformationModel request,
	) async {
		final response = await _dioClient.get(
			path: "/api/user/information",
			bodyRaw: request.toMap(),
		);
		return ResponseUserInformationModel.fromJson(response);
	}

}
