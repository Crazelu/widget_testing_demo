import 'package:flutter/material.dart';
import 'package:flutter_lagos_widget_testing_session/screens/login_screen.dart';

void main() {
  runApp(const WidgetTestingDemoApp());
}

class WidgetTestingDemoApp extends StatelessWidget {
  const WidgetTestingDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Testing Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            splashFactory: InkRipple.splashFactory,
            textStyle: MaterialStateProperty.resolveWith(
              (states) => const TextStyle(fontSize: 15),
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => Colors.black,
            ),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) => Colors.white,
            ),
            fixedSize: MaterialStateProperty.resolveWith(
              (states) => const Size(385, 52),
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
