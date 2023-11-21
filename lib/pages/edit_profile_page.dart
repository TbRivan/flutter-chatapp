import 'package:chat_app/components/app_text_field.dart';
import 'package:chat_app/components/toolbar.dart';
import 'package:chat_app/components/user_avatar.dart';
import 'package:chat_app/config/app_string.dart';
import 'package:chat_app/styles/app_colors.dart';
import 'package:chat_app/styles/app_text.dart';
import 'package:flutter/material.dart';

enum Gender { none, male, female }

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Toolbar(title: AppStrings.editProfile),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UserAvatar(size: 120),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              const AppTextField(hint: AppStrings.firstName),
              const SizedBox(height: 16),
              const AppTextField(hint: AppStrings.lastName),
              const SizedBox(height: 16),
              const AppTextField(hint: AppStrings.phoneNumber),
              const SizedBox(height: 16),
              const AppTextField(hint: AppStrings.location),
              const SizedBox(height: 16),
              const AppTextField(hint: AppStrings.birthday),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
                decoration: BoxDecoration(
                    color: AppColors.fieldColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: AppText.body1.copyWith(fontSize: 12),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              title: const Text('Male'),
                              value: Gender.male,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = Gender.male;
                                });
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            title: const Text('Female'),
                            value: Gender.female,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(
                                () {
                                  gender = Gender.female;
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
