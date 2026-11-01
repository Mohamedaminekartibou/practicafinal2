
import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {

  // Lista de tareas para la parte interactiva/ Dismissible
  List<String> tareas = ['Aprender Flutter','Practicar Java', 'Estudiar SQL','Crear aplicaciones',];

  // parte interactiva/ ReorderableListView
  List<String> tareasOrdenables = ['Programar en Java','Aprender Flutter','Estudiar bases de datos','Practicar SQL',];


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

          const SizedBox(height: 20),

          // parte interactiva/ ReorderableListView

          const Text(
            'Reordenar tareas',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tareasOrdenables.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex--;
                }

                final tarea = tareasOrdenables.removeAt(oldIndex);

                tareasOrdenables.insert(newIndex, tarea);
              });
            },
            itemBuilder: (context, index) {
              return Card(
                key: ValueKey(tareasOrdenables[index]),
                child: ListTile(
                  leading: const Icon(Icons.drag_handle),
                  title: Text(tareasOrdenables[index]),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // parte interactiva/ InteractiveViewer

          const Text(
            'Ampliar contenido',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 250,
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 4,
              child: Container(
                width: 300,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.flutter_dash,
                        size: 90,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'DevProfile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
