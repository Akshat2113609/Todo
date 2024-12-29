import 'package:flutter/material.dart';
import 'home_page.dart';
import 'API/api_posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      theme: isDarkMode
          ? ThemeData(
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 9, 16, 106)),
              scaffoldBackgroundColor: const Color.fromARGB(24,40,66,255),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Color.fromARGB(48,198,231,255),
              ),
            )
          : ThemeData(
              primarySwatch: Colors.yellow,
              appBarTheme: const AppBarTheme(color: Colors.yellow),
              scaffoldBackgroundColor: Colors.white,
            ),
      routes: {
        '/': (context) => HomePage(toggleTheme: toggleTheme),
        '/api-posts': (context) => const ApiPostsScreen(),
      },
      initialRoute: '/',
    );
  }
}
