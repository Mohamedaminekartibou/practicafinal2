import 'package:flutter/material.dart';

class PersonalScreen extends StatefulWidget {

  final Persona persona;

  const PersonalScreen({super.key,
    required this.persona,
  });

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi pantalla'),
      ),
      body: const Center(
        child: Text('Hola Flutter'),
      ),
    );
  }
}