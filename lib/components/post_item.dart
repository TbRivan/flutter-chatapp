import 'package:chat_app/styles/app_text.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String user;
  const PostItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/temp/auth.jpg',
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 16),
              Text(
                user,
                style: AppText.subtitle3,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Image.asset('assets/temp/coba.jpg'),
          const SizedBox(height: 12),
          const Text(
            'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores, voluptates?',
            style: AppText.subtitle3,
          )
        ],
      ),
    );
  }
}
