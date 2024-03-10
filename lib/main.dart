import 'package:flutter/material.dart';
import 'package:news/screens/splash_screen.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF39A552)),
      ),
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
      },
    );
  }
}
