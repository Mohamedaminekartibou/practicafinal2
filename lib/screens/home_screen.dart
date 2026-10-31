import 'package:flutter/material.dart';
import '../models/persona.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Persona persona = Persona(
    nom: 'Mohamed',
    cognoms: 'Kartibou',
    email: 'mohamed@example.com',
    contrasenya: '123456',
    dataNaixement: DateTime(2005, 1, 1),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevProfile'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 60),
              ),
              const SizedBox(height: 20),
              Text(
                '${persona.nom} ${persona.cognoms}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(persona.email),
              const SizedBox(height: 8),
              Text(
                'Data de naixement: '
                '${persona.dataNaixement.day}/'
                '${persona.dataNaixement.month}/'
                '${persona.dataNaixement.year}',
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text('Editar perfil'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.widgets),
                label: const Text('Explorar widgets'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}