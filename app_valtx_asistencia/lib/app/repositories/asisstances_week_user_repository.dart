import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_week_user_model.dart';
import 'package:app_valtx_asistencia/app/providers/asisstances_week_user_provider.dart';
import 'package:get/get.dart';

class AssistanceWeekUserRepository {
	final _apiProvider = Get.find<AssistanceWeekUserProvider>();

	Future<ResponseAssistancesWeekUserModel> getAssistancesWeek(
	RequestIdUserModel request,
	) =>
		_apiProvider.getAssistancesWeek(request);
}
