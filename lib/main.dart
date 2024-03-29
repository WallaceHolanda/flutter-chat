import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/screens.dart';
import 'package:flutter_chat/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: 'Flutter Chat',
      home: const HomeScreen(),
    );
  }
}
