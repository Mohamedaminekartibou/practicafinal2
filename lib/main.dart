

import 'package:flutter/material.dart';

import 'models/persona.dart';
import 'screens/home_screen.dart';
import 'screens/personal_screen.dart';
import 'screens/widget_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevProfile',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const HomePage(),

        '/personal': (context) {
          final persona = ModalRoute.of(context)!.settings.arguments as Persona;

          return PersonalScreen(persona: persona);
        },

        '/widgets': (context) => const WidgetScreen(),
      },
    );
  }
}