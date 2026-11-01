
import 'package:flutter/material.dart';
import '../models/persona.dart';

class PersonalScreen extends StatefulWidget {
  final Persona persona;

  const PersonalScreen({
    super.key,
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Introdueix el nom';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: cognomsController,
                decoration: const InputDecoration(
                  labelText: 'Cognoms',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Introdueix els cognoms';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correu electrònic',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Introdueix el correu electrònic';
                  }

                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                      .hasMatch(value.trim())) {
                    return 'Introdueix un correu vàlid';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: contrasenyaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contrasenya',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Introdueix la contrasenya';
                  }

                  if (value.length < 6) {
                    return 'Mínim 6 caràcters';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              ListTile(
                title: const Text('Data de naixement'),
                subtitle: Text(
                  '${dataNaixement.day}/${dataNaixement.month}/${dataNaixement.year}',
                ),
                trailing: const Icon(Icons.calendar_month),
                onTap: () async {
                  final DateTime? dataSeleccionada =
                      await showDatePicker(
                    context: context,
                    initialDate: dataNaixement,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );

                  if (dataSeleccionada != null) {
                    setState(() {
                      dataNaixement = dataSeleccionada;
                    });
                  }
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Persona personaActualizada = Persona(
                      nom: nomController.text.trim(),
                      cognoms: cognomsController.text.trim(),
                      email: emailController.text.trim(),
                      contrasenya: contrasenyaController.text,
                      dataNaixement: dataNaixement,
                    );

                    Navigator.pop(context, personaActualizada);
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Guardar cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
