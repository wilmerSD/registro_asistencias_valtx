import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_register_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/providers/register_marking_user_provider.dart';
import 'package:get/get.dart';

class RegisterMarkingUserRepository{
  final _apiProvider = Get.find<RegisterMarkingUserProvider>();

  Future<ResponseRegisterMarkingUserModel> postRegisterMarking(
    RequestMarkingUserModel request,
  ) =>
      _apiProvider.postRegisterMarking(request);

}
