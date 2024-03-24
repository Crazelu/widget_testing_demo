import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lagos_widget_testing_session/utils/constants.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';

class NetworkNotificationBanner extends StatelessWidget {
  const NetworkNotificationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final connectivityResult = snapshot.data!;

          final hasInternetConnection =
              !connectivityResult.contains(ConnectivityResult.none);

          return AnimatedContainer(
            height: 48,
            duration: const Duration(seconds: 1),
            color: hasInternetConnection ? Colors.green : Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  Icon(
                    hasInternetConnection
                        ? PhosphorIcons.wifi_high
                        : PhosphorIcons.wifi_slash,
                    color: Colors.white,
                  ),
                  const Gap(8),
                  Text(
                    hasInternetConnection
                        ? AppStrings.youAreOnline
                        : AppStrings.youAreOffline,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
