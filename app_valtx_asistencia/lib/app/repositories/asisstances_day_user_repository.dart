import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_day_user_model.dart';
import 'package:app_valtx_asistencia/app/providers/assistances_day_user_provider.dart';
import 'package:get/get.dart';

class AssistanceDayUserRepository {
	final _apiProvider = Get.find<AssistanceDayUserProvider>();

	Future<ResponseAssistancesDayUserModel> getAssistancesDay(
	RequestIdUserModel request,
	) =>
		_apiProvider.getAssistancesDay(request);

}
