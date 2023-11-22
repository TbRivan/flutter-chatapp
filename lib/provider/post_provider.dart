import 'package:chat_app/data/model/model.dart';
import 'package:chat_app/data/service/create_post_service.dart';
import 'package:chat_app/data/service/get_post_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  String message = '';

  getPost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }

  Future<void> createPost(String token) async {
    await CreatePostService(message: message, image: null, token: token).call();
    message = '';
    getPost();
  }
}
