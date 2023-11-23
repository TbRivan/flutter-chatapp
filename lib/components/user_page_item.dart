import 'package:chat_app/components/user_avatar.dart';
import 'package:chat_app/data/model/user.dart';
import 'package:chat_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class UserPageItem extends StatelessWidget {
  final User user;

  const UserPageItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const UserAvatar(size: 50),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstname} ${user.lastname}',
                    style: AppText.subtitle1.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  Text(user.location?.name ?? '',
                      style: AppText.body2.copyWith(color: Colors.black)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
