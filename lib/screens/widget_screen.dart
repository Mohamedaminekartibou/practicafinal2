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
      // parte interactiva
    
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tareas.length,
        itemBuilder: (context, index) {
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
        },
      ),
    );
  }
}