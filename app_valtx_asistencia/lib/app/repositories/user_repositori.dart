import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/providers/user_provider.dart';
import 'package:get/get.dart';

class UserRepository {
	final _apiProvider = Get.find<UserProvider>();

	Future<ResponseUserInformationModel> getUserInformation(
	RequestUserInformationModel request,
	) =>
		_apiProvider.getUserInformation(request);

}
