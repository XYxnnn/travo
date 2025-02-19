import 'package:flutter/material.dart';
import 'package:swe2109567_assignment1/models/note_model.dart';
import 'package:swe2109567_assignment1/database/sqlite.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final title = TextEditingController();
  final content = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final db = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Travel Notes"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  db
                      .createNote(NoteModel(
                      noteTitle: title.text,
                      noteContent: content.text,
                      createdAt: DateTime.now().toIso8601String()))
                      .whenComplete(() {
                        Navigator.of(context).pop(true);
                      });
                }
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(top:40, left:20, right:20),
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Title is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Title"),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: content,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Content is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Content"),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}