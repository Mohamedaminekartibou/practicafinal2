
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/personal_screen.dart';
import 'models/persona.dart';


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
      home: PersonalScreen(
        persona: Persona(
          nom: 'Mohamed',
          cognoms: 'Amine',
          email: 'mohamed@example.com',
          contrasenya: '123456',
          dataNaixement: DateTime(2005, 1, 1),
        ),
      ),
    );
  }
}
