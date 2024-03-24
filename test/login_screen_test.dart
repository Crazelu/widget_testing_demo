import 'package:flutter/material.dart';
import 'package:flutter_lagos_widget_testing_session/screens/dashboard_screen.dart';
import 'package:flutter_lagos_widget_testing_session/screens/login_screen.dart';
import 'package:flutter_lagos_widget_testing_session/utils/constants.dart';
import 'package:flutter_lagos_widget_testing_session/widgets/password_text_field.dart';
import 'package:flutter_test/flutter_test.dart';

import 'setup.dart';

void main() {
  group(
    'LoginScreen Tests ',
    () {
      testWidgets(
        'Verify that email input validation error '
        'is shown when login button is tapped with empty email',
        (tester) async {
          await tester.pumpWidget(
            setupForTesting(const LoginScreen()),
          );

          final loginButton = find.byType(TextButton);
          await tester.tap(loginButton);
          await tester.pump();

          expect(find.text(AppStrings.pleaseEnterAValidEmail), findsOneWidget);
        },
      );
      testWidgets(
        'Verify that email input validation error '
        'is shown when login button is tapped with an invalid email',
        (tester) async {
          await tester.pumpWidget(
            setupForTesting(const LoginScreen()),
          );

          final emailTextField = find.byKey(const ValueKey('Email-Text-Field'));
          await tester.enterText(emailTextField, 'user');
          await tester.pump();

          final loginButton = find.byType(TextButton);
          await tester.tap(loginButton);
          await tester.pump();

          expect(find.text(AppStrings.pleaseEnterAValidEmail), findsOneWidget);
        },
      );
      testWidgets(
        'Verify that email input validation error '
        'is NOT shown when login button is tapped with a valid email',
        (tester) async {
          await tester.pumpWidget(
            setupForTesting(const LoginScreen()),
          );

          final emailTextField = find.byKey(const ValueKey('Email-Text-Field'));
          await tester.enterText(emailTextField, 'user@test.com');
          await tester.pump();

          final loginButton = find.byType(TextButton);
          await tester.tap(loginButton);
          await tester.pump();

          expect(find.text(AppStrings.pleaseEnterAValidEmail), findsNothing);
        },
      );

      testWidgets(
        'Verify that password input validation error '
        'is shown when login button is clicked with empty password',
        (tester) async {
          await tester.pumpWidget(
            setupForTesting(const LoginScreen()),
          );

          final loginButton = find.byType(TextButton);
          await tester.tap(loginButton);
          await tester.pump();

          expect(
            find.text(AppStrings.pleaseEnterPassword),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'Verify that password input validation error '
        'is shown when login button is clicked with an invalid password',
        (tester) async {
          await tester.pumpWidget(
            setupForTesting(const LoginScreen()),
          );

          final passwordTextField = find.byType(PasswordTextField);
          await tester.enterText(passwordTextField, 'Pass');
          await tester.pump();

          final loginButton = find.byType(TextButton);
          await tester.tap(loginButton);
          await tester.pump();

          expect(
            find.text(AppStrings.passwordMustContainAtLeast8Characters),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'Verify that password input validation error '
        'is NOT shown when login button is clicked with a valid password',
        (tester) async {
          await tester.pumpWidget(
            setupForTesting(const LoginScreen()),
          );

          final passwordTextField = find.byType(PasswordTextField);
          await tester.enterText(passwordTextField, 'Password');
          await tester.pump();

          final loginButton = find.byType(TextButton);
          await tester.tap(loginButton);
          await tester.pump();

          expect(
            find.text(AppStrings.pleaseEnterPassword),
            findsNothing,
          );
          expect(
            find.text(AppStrings.passwordMustContainAtLeast8Characters),
            findsNothing,
          );
        },
      );

      testWidgets(
        'Verify that dashboard screen is shown when valid email and '
        'password is entered and the Login button is pressed',
        (tester) async {
          await tester.pumpWidget(
            setupForTesting(const LoginScreen()),
          );

          final emailTextField = find.byKey(const ValueKey('Email-Text-Field'));
          await tester.enterText(emailTextField, 'user@test.com');

          final passwordTextField = find.byType(PasswordTextField);
          await tester.enterText(passwordTextField, 'Password');

          await tester.pump();

          final loginButton = find.byType(TextButton);
          await tester.tap(loginButton);

          await tester.pumpAndSettle();
          expect(find.byType(DashboardScreen), findsOneWidget);
          expect(find.byType(LoginScreen), findsNothing);
        },
      );
    },
  );
}
