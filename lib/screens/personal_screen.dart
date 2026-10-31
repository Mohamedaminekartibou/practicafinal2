import 'package:flutter/material.dart';
import '../models/persona.dart';

class PersonalScreen extends StatefulWidget {

  final Persona persona;

  const PersonalScreen({super.key,
    required this.persona,
  });

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}




class _PersonalScreenState extends State<PersonalScreen> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController nomController;
  late TextEditingController cognomsController;
  late TextEditingController emailController;
  late TextEditingController contrasenyaController;

  late DateTime dataNaixement;


   // Creamos los controladores 
@override
void initState() {
  super.initState();

  nomController = TextEditingController(
    text: widget.persona.nom,
  );

  cognomsController = TextEditingController(
    text: widget.persona.cognoms,
  );

  emailController = TextEditingController(
    text: widget.persona.email,
  );

  contrasenyaController = TextEditingController(
    text: widget.persona.contrasenya,
  );

  dataNaixement = widget.persona.dataNaixement;
}

@override
void dispose() {
  nomController.dispose();
  cognomsController.dispose();
  emailController.dispose();
  contrasenyaController.dispose();

  super.dispose();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              TextFormField(
                controller: nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: cognomsController,
                decoration: const InputDecoration(
                  labelText: 'Cognoms',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Correu electrònic',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: contrasenyaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contrasenya',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}