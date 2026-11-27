import 'package:flutter/material.dart';
import '../../../../ core/constants/app_colors.dart';
import 'UserLoginPage.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final formKey = GlobalKey<FormState>();

  final phoneOrEmailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    phoneOrEmailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(
          color: AppColors.primary,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 12),

                const Icon(
                  Icons.menu_book_rounded,
                  size: 84,
                  color: AppColors.primary,
                ),

                const SizedBox(height: 18),

                const Text(
                  'Admin Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 24),

                // User / Admin Switch
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserLoginPage(),
                              ),
                            );
                          },
                          child: const Center(
                            child: Text('User'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'Admin',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Phone or Email
                TextFormField(
                  controller: phoneOrEmailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Phone Number or Email',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your phone number or email';
                    }

                    String input = value.trim();

                    if (input.contains('@')) {
                      if (!RegExp(r'^[^@\s]+@gmail\.com$').hasMatch(input)) {
                        return 'Email must end with @gmail.com';
                      }
                    } else {
                      if (!RegExp(r'^\d{1,10}$').hasMatch(input)) {
                        return 'Phone number must contain up to 10 digits';
                      }
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // Password
                TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    prefixIcon: const Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Login will be connected to Laravel later.
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}