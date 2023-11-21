import 'package:chat_app/pages/edit_profile_page.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/main_page.dart';
import 'package:chat_app/pages/nearby_page.dart';

class AppRoutes {
  static final pages = {
    login: (context) => const LoginPage(),
    home: (context) => HomePage(),
    main: (context) => const MainPage(),
    editProfile: (context) => const EditProfilePage(),
    nearby: (context) => const NearbyPage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/edit_profile';
  static const nearby = '/nearby';
}
