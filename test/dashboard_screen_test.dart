import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lagos_widget_testing_session/screens/dashboard_screen.dart';
import 'package:flutter_lagos_widget_testing_session/screens/login_screen.dart';
import 'package:flutter_lagos_widget_testing_session/utils/constants.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_test/flutter_test.dart';

import 'connectivity_platform_stub.dart';
import 'setup.dart';

void main() {
  group(
    'DashboardScreen Tests',
    () {
      testWidgets(
        'Verify that clicking Logout button shows the login screen',
        (tester) async {
          await tester.pumpWidget(
            setupForTesting(const DashboardScreen()),
          );

          final logoutButton = find.byType(TextButton);

          await tester.tap(logoutButton);
          await tester.pumpAndSettle();

          expect(find.byType(LoginScreen), findsOneWidget);
          expect(find.byType(DashboardScreen), findsNothing);
        },
      );

      testWidgets(
        'Verify that the "You are online" banner is shown '
        'when there is internet access',
        (tester) async {
          final connectivityPlatformStub = ConnectivityPlatformStub();
          ConnectivityPlatform.instance = connectivityPlatformStub;

          await tester.pumpWidget(
            setupForTesting(const DashboardScreen()),
          );

          connectivityPlatformStub
              .setConnectivityResult(ConnectivityResult.mobile);

          await tester.pump();

          expect(find.text(AppStrings.youAreOnline), findsOneWidget);
          expect(find.byIcon(PhosphorIcons.wifi_high), findsOneWidget);
        },
      );
      testWidgets(
        'Verify that the "You are offline" banner is shown '
        'when there is no internet access',
        (tester) async {
          final connectivityPlatformStub = ConnectivityPlatformStub();
          ConnectivityPlatform.instance = connectivityPlatformStub;

          await tester.pumpWidget(
            setupForTesting(const DashboardScreen()),
          );

          connectivityPlatformStub
              .setConnectivityResult(ConnectivityResult.none);

          await tester.pump();

          expect(find.text(AppStrings.youAreOnline), findsNothing);
          expect(find.byIcon(PhosphorIcons.wifi_high), findsNothing);

          expect(find.text(AppStrings.youAreOffline), findsOneWidget);
          expect(find.byIcon(PhosphorIcons.wifi_slash), findsOneWidget);
        },
      );
    },
  );
}
