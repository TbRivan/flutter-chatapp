// ignore_for_file: must_be_immutable

import 'package:chat_app/components/post_item.dart';
import 'package:chat_app/components/toolbar.dart';
import 'package:chat_app/config/app_routes.dart';
import 'package:chat_app/config/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> users = [];

  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.appName,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.nearby);
            },
            icon: SvgPicture.asset('assets/svg/ic_location.svg'),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(user: users[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 24,
          );
        },
        itemCount: users.length,
      ),
    );
  }

  mockUsersFromServer() {
    for (var i = 0; i < 20; i++) {
      users.add('User number $i');
    }
  }
}
