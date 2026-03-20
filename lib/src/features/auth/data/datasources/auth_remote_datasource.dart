import 'package:dio/dio.dart';

import '../../../../core/config/app_config.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource(this._dio);
  final Dio _dio;

  Future<String> login({required String email, required String password}) async {
    final response = await _dio.post(
      AppConfig.loginPath,
      data: {'email': email, 'password': password},
    );
    final data = response.data as Map<String, dynamic>;
    final token = (data['data']?['token'] ?? data['token'])?.toString();
    if (token == null || token.isEmpty) throw Exception('Token absent');
    return token;
  }
}
