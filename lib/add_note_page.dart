import 'package:flutter/material.dart';
import 'package:flutter_application_1/note_model.dart';
import 'package:hive/hive.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('add note'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  maxLines: 1,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    filled: true,
                    hintText: 'enter your title here',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _descriptionController,
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    filled: true,
                    hintText: 'enter your description here',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: _addNote,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('add your note'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addNote() {
    final note = Note(_titleController.text, _descriptionController.text);
    Hive.box<Note>('notes').add(note);
    _titleController.clear();
    _descriptionController.clear();
    
    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Note added successfully!')),
    );
    
    // Navigate back to the home page
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}