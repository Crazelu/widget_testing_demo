import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lagos_widget_testing_session/utils/constants.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';

class NetworkNotificationBanner extends StatefulWidget {
  const NetworkNotificationBanner({super.key});

  @override
  State<NetworkNotificationBanner> createState() =>
      _NetworkNotificationBannerState();
}

class _NetworkNotificationBannerState extends State<NetworkNotificationBanner> {
  final _viewModel = NetworkNotificationBannerViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        final hasInternetConnection = _viewModel.hasInternetConnection;

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
      },
    );
  }
}

class NetworkNotificationBannerViewModel extends ChangeNotifier {
  NetworkNotificationBannerViewModel() {
    _listenForConnectivityChanges();
  }

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _streamSubscription;

  bool _hasInternetConnection = true;

  set hasInternetConnection(bool value) {
    if (_hasInternetConnection != value) {
      _hasInternetConnection = value;
      notifyListeners();
    }
  }

  bool get hasInternetConnection => _hasInternetConnection;

  void _listenForConnectivityChanges() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen(
      (event) {
        hasInternetConnection =
            event.isNotEmpty && event.first != ConnectivityResult.none;
      },
    );
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
