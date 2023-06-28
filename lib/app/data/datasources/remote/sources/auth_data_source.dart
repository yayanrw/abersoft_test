import 'dart:convert';

import 'package:abersoft_test/app/core/networking/api_client.dart';
import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/data/datasources/remote/models/end_points.dart';
import 'package:abersoft_test/app/data/datasources/remote/requests/login_request.dart';
import 'package:abersoft_test/app/data/datasources/remote/responses/login_response.dart';
import 'package:get/get.dart';

abstract class AuthDataSource {
  Future<LoginResponse> fetchLogIn(LoginRequest loginRequest);
}

class AuthDataSourceImpl implements AuthDataSource {
  final _apiClient = Get.find<ApiClient>();
  final _endPoints = Get.find<EndPoints>();

  @override
  Future<LoginResponse> fetchLogIn(LoginRequest loginRequest) async {
    final response = await _apiClient.post(
      NetworkHelper.genUri(_endPoints.authEndPoints.logIn),
      body: jsonEncode(loginRequest.toJson()),
    );

    final res = NetworkHelper.throwExceptionIfClientError(response);
    return LoginResponse.fromJson(jsonDecode(res.body));
  }
}
