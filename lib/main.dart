import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seed = const Color(0xFF6C63FF);
    return MaterialApp(
      title: 'LMS Platform',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light),
        textTheme: TextTheme(
          headlineSmall: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          headlineMedium: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
          titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          bodyMedium: const TextStyle(fontSize: 15),
          bodySmall: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
      ),
      themeMode: ThemeMode.light,
      // LoginPage is the initial screen (home). Register HomePage route for navigation.
      home: const LoginPage(),
      routes: {
        '/home': (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
