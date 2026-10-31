import 'package:flutter/material.dart';

class PersonalScreen extends StatefulWidget {

  final Persona persona;

  const PersonalScreen({super.key,
    required this.persona,
  });

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}


class _PersonalScreenState extends State<PersonalScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
      ),
      body: const Center(
        child: Text('Pantalla de datos personales'),
      ),
    );
  }
}