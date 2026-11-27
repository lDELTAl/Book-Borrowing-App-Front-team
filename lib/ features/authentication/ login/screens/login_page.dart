import 'package:flutter/material.dart';
import '../../../../ core/constants/app_colors.dart';
import '../register/screens/register_page.dart';
import 'UserLoginPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.menu_book_rounded,
                size: 150,
                color: AppColors.primary,
              ),

              const SizedBox(height: 35),

              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Borrow Books Easily',
                style: TextStyle(
                  fontSize: 19,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 65),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserLoginPage(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text('Create Account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}