import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
  
  
}

class _WidgetScreenState extends State<WidgetScreen> {

  List<String> tareas = ['Aprender Flutter','Practicar Java', 'Estudiar SQL','Crear aplicaciones',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorar widgets'),
      ),
      // parte interactiva/ Dismissible 
    
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Mis tareas',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          ...List.generate(tareas.length, (index) {
            return Dismissible(
              key: Key(tareas[index]),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  tareas.removeAt(index);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tarea eliminada'),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.task_alt),
                  title: Text(tareas[index]),
                ),
              ),
            );
          }),

          const SizedBox(height: 20),

          const Text(
            'Información',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          // parte interactiva/ ExpansionTile
          const SizedBox(height: 10),

          ExpansionTile(
            leading: const Icon(Icons.code),
            title: const Text('¿Qué es Flutter?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Flutter es un framework de Google '
                  'que permite crear aplicaciones multiplataforma.',
                ),
              ),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.storage),
            title: const Text('¿Qué es una base de datos?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Una base de datos permite almacenar, '
                  'organizar y consultar información.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}