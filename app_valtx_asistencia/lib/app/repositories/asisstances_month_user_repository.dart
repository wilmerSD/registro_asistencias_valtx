import 'package:app_valtx_asistencia/app/models/request/request_assistance%20_information_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/providers/assistances_month_user_provider.dart';
import 'package:get/get.dart';

class AssistanceMonthUserRepository {
	final _apiProvider = Get.find<AssistanceMonthUserProvider>();

	Future<ResponseAssistancesMonthUserModel> getAssistancesMonth(
	RequestIdUserModel request,
	) =>
		_apiProvider.getAssistancesMonth(request);

  Future<ResponseAssistancesMonthUserModel> getAssistancesMonthDate(
    RequestAssistanceInformationModel request,
    ) =>
      _apiProvider.getAssistancesMonthDate(request);
}
