import 'package:chat_app/data/response/login_response.dart';
import 'package:chat_app/data/service/login_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  var username = '';
  var password = '';
  Future<LoginResponse> login() async {
    return LoginService(username, password).call();
  }
}
