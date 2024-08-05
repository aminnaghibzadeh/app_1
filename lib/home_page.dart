import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_1/note_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Note>('notes').listenable(),
        builder: (context, Box<Note> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text('No notes yet'),
            );
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              final note = box.values.elementAt(index);
              return Card(
                color: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: const BorderSide(color: Colors.black),
                ),
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    note.title,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}