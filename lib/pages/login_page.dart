import 'package:chat_app/config/app_routes.dart';
import 'package:chat_app/config/app_string.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Scroll vertikal
        child: SizedBox(
          height: MediaQuery.of(context)
              .size
              .height, // Agar dapat mendapatkan tinggi yang dinamis dari device
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(), // spacer otomatis secara dinamis
                const Text(
                  AppStrings.helloWelcome,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Urbanist',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  AppStrings.loginToContinue,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      debugPrint('Forgot is clicked');
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text(AppStrings.forgotPassword),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.main);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Login'),
                  ),
                ),
                const Spacer(),
                const Text(
                  AppStrings.loginToContinue,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Google is clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Rata tengah
                      children: [
                        Image.asset(
                          'assets/images/google-icon.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 8),
                        const Text(AppStrings.loginWithGoogle)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Facebook is clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/fb-icon.png',
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(width: 8),
                        const Text(AppStrings.loginWithFacebook)
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.dontHaveAccount,
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.amber,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
