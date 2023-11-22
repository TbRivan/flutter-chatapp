// ignore_for_file: must_be_immutable

import 'package:chat_app/components/post_item.dart';
import 'package:chat_app/components/toolbar.dart';
import 'package:chat_app/config/app_routes.dart';
import 'package:chat_app/config/app_string.dart';
import 'package:chat_app/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PostProvider>().getPost();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<PostProvider>(
        builder: (context, value, child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return PostItem(post: value.list[index]);
            },
            itemCount: value.list.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 24,
              );
            },
          );
        },
      ),
    );
  }
}
