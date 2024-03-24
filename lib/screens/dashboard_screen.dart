import 'package:flutter/material.dart';
import 'package:flutter_lagos_widget_testing_session/assets.dart';
import 'package:flutter_lagos_widget_testing_session/screens/login_screen.dart';
import 'package:flutter_lagos_widget_testing_session/widgets/network_notification_banner.dart';
import 'package:gap/gap.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.maleMemoji.assetName,
                  height: 80,
                  width: 80,
                ),
                const Gap(8),
                Text(
                  'Your dashboard is under construction',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Gap(24),
                TextButton(
                  child: const Text('Logout'),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: NetworkNotificationBanner(),
        ),
      ],
    );
  }
}
