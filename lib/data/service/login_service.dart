import 'dart:convert';

import 'package:chat_app/config/app_config.dart';
import 'package:chat_app/data/response/login_response.dart';
import 'package:chat_app/data/service/base_service.dart';
import 'package:http/http.dart' as http;

class LoginService extends ServiceBase {
  final String username;
  final String password;

  LoginService(this.username, this.password);

  @override
  Future<LoginResponse> call() async {
    final result = await http.post(
      Uri.parse('${AppConfig.baseUrl}/login'),
      body: jsonEncode(
        {
          'username': username,
          'password': password,
        },
      ),
    );
    return LoginResponse.fromJson(jsonDecode(result.body)['data']);
  }
}
