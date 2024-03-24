import 'package:flutter/material.dart';
import 'package:flutter_lagos_widget_testing_session/assets.dart';
import 'package:flutter_lagos_widget_testing_session/screens/dashboard_screen.dart';
import 'package:flutter_lagos_widget_testing_session/utils/validators.dart';
import 'package:flutter_lagos_widget_testing_session/widgets/password_text_field.dart';
import 'package:flutter_lagos_widget_testing_session/widgets/text_field.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const Gap(96),
            Image.asset(
              AppAssets.femaleMemoji.assetName,
              height: 80,
              width: 80,
            ),
            const Gap(8),
            Text(
              'Welcome back!\nLogin to your account',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Gap(56),
            AppTextField(
              key: const ValueKey('Email-Text-Field'),
              hint: 'Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: Validators.validateEmail,
            ),
            const Gap(24),
            PasswordTextField(
              hint: 'Password',
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.go,
              validator: Validators.validatePassword,
            ),
            const Gap(56),
            TextButton(
              child: const Text('Login'),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const DashboardScreen(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
