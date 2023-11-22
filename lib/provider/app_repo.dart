import 'package:chat_app/data/model/user.dart';
import 'package:flutter/material.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  User? user;

  set token(String? value) {
    _token = value;
  }

  // ignore: unnecessary_getters_setters
  String? get token => _token;
}
