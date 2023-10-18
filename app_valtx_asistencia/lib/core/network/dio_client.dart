//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as state;

class DioClient {
	final _dio = state.Get.find<Dio>();

	/// [POST]
	Future<dynamic> post({
		String path = '',
		String? token,
		Map<String, String>? headers,
		Map<String, dynamic>? formData,
		Map<String, dynamic>? bodyRaw,
		Map<String, dynamic>? queryParameters,
	}) async {
		if (!await _checkInternetConnection()) {
			throw Exception(['NOT_INTERNET_EXCEPTION']);
		}
		interceptorHeader(headers: headers, token: await StorageService.get(Keys.kTokenSesion),);
		final response = await _dio
			.post(path,
				data: bodyRaw ?? FormData.fromMap(formData!),
				options: Options(
					method: 'POST',
				),
				queryParameters: queryParameters)
			.catchError((error) {
			DioException dioError = error;
			return dioError.response!.data;
		}).timeout(
			_dio.options.connectTimeout ?? const Duration(milliseconds: 30),
			onTimeout: () {
				throw Exception(['TIME_OUT']);
			},
		);
		return response.data;
	}

	Future<dynamic> put(
		{String path = '',
		String? token,
		Map<String, String>? headers,
		Map<String, dynamic>? formData,
		Map<String, dynamic>? bodyRaw,
		Map<String, dynamic>? queryParameters}) async {
		if (!await _checkInternetConnection()) {
			throw Exception(['NOT_INTERNET_EXCEPTION']);
		}
		interceptorHeader(headers: headers, token: await StorageService.get(Keys.kTokenSesion),);
		final response = await _dio
			.put(path,
				data: bodyRaw,
				options: Options(method: 'PUT'),
				queryParameters: queryParameters)
			.catchError((error) {
			DioException dioError = error;
			return dioError.response!.data;
		}).timeout(
			_dio.options.connectTimeout ?? const Duration(milliseconds: 30),
			onTimeout: () {
				throw Exception(['TIME_OUT']);
			},
		);
		return response.data;
	}

	Future<dynamic> delete(
		{String path = '',
		String? token,
		Map<String, String>? headers,
		Map<String, dynamic>? formData,
		Map<String, dynamic>? bodyRaw,
		Map<String, dynamic>? queryParameters}) async {
		if (!await _checkInternetConnection()) {
			throw Exception(['NOT_INTERNET_EXCEPTION']);
		}
		interceptorHeader(headers: headers, token: await StorageService.get(Keys.kTokenSesion),);
		final response = await _dio
			.delete(path,
				data: bodyRaw,
				options: Options(method: 'DELETE'),
				queryParameters: queryParameters)
			.catchError((error) {
			DioException dioError = error;
			return dioError.response!.data;
		}).timeout(
			_dio.options.connectTimeout ?? const Duration(milliseconds: 30),
			onTimeout: () {
				throw Exception(['TIME_OUT']);
			},
		);
		return response.data;
	}

	/// [GET]
	Future<dynamic> get({
		String path = '',
		//String? token,
    Map<String, dynamic>? bodyRaw,
		Map<String, String>? headers,
		Map<String, dynamic>? queryParameters,
	}) async {
		if (!await _checkInternetConnection()) {
			throw Exception(['NOT_INTERNET_EXCEPTION']);
		}
		interceptorHeader(
			headers: headers,
			token: await StorageService.get(Keys.kTokenSesion),
		);

		/* final response = await _dio
		.get(path,
			options: Options(method: 'GET'), queryParameters: queryParameters)
		.catchError((error) {
		DioError dioError = error;
		return dioError.response?.data;
	}).timeout(Duration(milliseconds: _dio.options.connectTimeout),
		onTimeout: () {
		throw Exception(['TIME_OUT']);
	});

	return response.data; */
		return _dio
			.get(
			path,
			options: Options(method: 'GET', responseType: ResponseType.json),
      data: bodyRaw,
			//queryParameters: queryParameters,
		)
			.then((Response response) {
			return response.data;
		}).catchError((error) {
			DioError dioError = error;
			if (dioError.response?.statusCode != 500) {
				return dioError.response!.statusMessage;
			} else {
				throw Exception('SERVER_ERROR');
			}
		}).timeout(_dio.options.connectTimeout ?? const Duration(milliseconds: 30),
			onTimeout: () {
			throw Exception(['TIME_OUT']);
		});
	}

	void interceptorHeader({
		Map<String, String>? headers,
		String token = "",
	}) {
		if (headers != null) {
			_dio.options.headers.addAll(headers);
		}
		if (token.isNotEmpty) {
			_dio.options.headers.addAll({"Authorization": "Bearer $token"});
		} else {
			_dio.options.headers.remove("Authorization");
		}
	}

	Future<bool> _checkInternetConnection() async {
		/* var connectivityResult = await (Connectivity().checkConnectivity());
	if (connectivityResult == ConnectivityResult.none) {
		return false;
	} */
		return true;
	}
}
