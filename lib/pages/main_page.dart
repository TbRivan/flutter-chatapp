import 'package:chat_app/components/bottom_navigation_item.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/profile_page.dart';
import 'package:chat_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus currentIndex = Menus.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: pages[currentIndex.index],
        bottomNavigationBar: MyBottomNavigation(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ));
  }

  final pages = [
    HomePage(),
    const Center(child: Text('Favorite')),
    const Center(child: Text('Add Post')),
    const Center(child: Text('Messages')),
    const ProfilePage()
  ];
}

enum Menus {
  home,
  favorite,
  add,
  messages,
  user,
}

class MyBottomNavigation extends StatelessWidget {
  final Menus currentIndex;
  final ValueChanged<Menus> onTap;
  const MyBottomNavigation(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: const EdgeInsets.all(24),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 17,
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                children: [
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.home),
                        icon: 'assets/svg/ic_home.svg',
                        current: currentIndex,
                        name: Menus.home),
                  ),
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.favorite),
                        icon: 'assets/svg/ic_favorite.svg',
                        current: currentIndex,
                        name: Menus.favorite),
                  ),
                  const Spacer(),
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.messages),
                        icon: 'assets/svg/ic_messages.svg',
                        current: currentIndex,
                        name: Menus.messages),
                  ),
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.user),
                        icon: 'assets/svg/ic_user.svg',
                        current: currentIndex,
                        name: Menus.user),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(Menus.add),
              child: Container(
                width: 64,
                height: 64,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
                child: SvgPicture.asset('assets/svg/ic_add.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
