import 'package:dio/dio.dart';
import 'package:flutter_modular_app/data/infrastructure/api_service_interface.dart';
import 'package:flutter_modular_app/data/payload/contracts/api_request_interface.dart';

class ApiService extends ApiServiceInterface {
  Dio dio;

  ApiService(
    this.dio,
  );

  // send http request
  @override
  Future<Map<String, dynamic>> invokeHttp(
    String url,
    ApiRequestInterface body, {
    Map<String, String>? headers,
  }) async {
    Response response;
    // set token
    var data = body.encode();
    // data["api.token"] = _userData.token;

    try {
      response = await _invoke(
        url,
        data,
        headers: headers,
      );
    } catch (error) {
      rethrow;
    }

    return response.data;
  }

  // setup request type and configuration
  Future<Response> _invoke(
    String url,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    Response response;
    try {
      response = await dio.post(url,
          data: body,
          options: Options(
            headers: headers,
          ));
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
