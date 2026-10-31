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