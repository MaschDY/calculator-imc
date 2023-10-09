import 'package:flutter/material.dart';

import 'page/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            foregroundColor: Colors.white,
            color: Colors.blueGrey),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blueGrey, foregroundColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56.0),
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)
            .copyWith(background: const Color.fromARGB(255, 230, 230, 230)),
      ),
      home: const HomePage(),
    );
  }
}
