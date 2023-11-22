import 'package:chat_app/components/toolbar.dart';
import 'package:chat_app/components/user_avatar.dart';
import 'package:chat_app/config/app_routes.dart';
import 'package:chat_app/config/app_string.dart';
import 'package:chat_app/provider/app_repo.dart';
import 'package:chat_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ProfileMenu {
  edit,
  logout,
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppRepo>().user;
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.profile,
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoutes.editProfile);
                  break;
                case ProfileMenu.logout:
                  break;
                default:
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                    value: ProfileMenu.edit, child: Text('Edit')),
                const PopupMenuItem(
                    value: ProfileMenu.logout, child: Text('Log Out'))
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          const UserAvatar(size: 90),
          const SizedBox(height: 24),
          Text(
            '${user?.firstname} ${user?.lastname}',
            style: AppText.header2,
          ),
          const SizedBox(height: 12),
          const Text(
            'Indonesia',
            style: AppText.subtitle3,
          ),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '200',
                    style: AppText.header2,
                  ),
                  Text('Followers')
                ],
              ),
              Column(
                children: [
                  Text(
                    '5',
                    style: AppText.header2,
                  ),
                  Text('Posts')
                ],
              ),
              Column(
                children: [
                  Text(
                    '121',
                    style: AppText.header2,
                  ),
                  Text('Following')
                ],
              ),
            ],
          ),
          const Divider(thickness: 1, height: 24)
        ],
      ),
    );
  }
}
