import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:swe2109567_assignment1/models/note_model.dart';
import 'package:swe2109567_assignment1/database/sqlite.dart';
import 'package:swe2109567_assignment1/widgets/create_note.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  late DatabaseHelper handler;
  late Future<List<NoteModel>> notes;
  final db = DatabaseHelper();

  final title = TextEditingController();
  final content = TextEditingController();
  final keyword = TextEditingController();

  @override
  void initState() {
    handler = DatabaseHelper();
    notes = handler.getNotes();

    handler.initDB().whenComplete(() {
      notes = getAllNotes();
    });
    super.initState();
  }

  Future<List<NoteModel>> getAllNotes() {
    return handler.getNotes();
  }

  //Search method here
  Future<List<NoteModel>> searchNote() {
    return handler.searchNotes(keyword.text);
  }

  //Refresh method
  Future<void> _refresh() async {
    setState(() {
      notes = getAllNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Notes")
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff9DCFFF),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateNote()))
                .then((value) {
              if (value) {
                _refresh();
              }
            });
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            //Search Field
            Container(
              margin: const EdgeInsets.only(top:40, left:20, right:20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12.withOpacity(0.10),
                        blurRadius: 30
                    )
                  ]
              ),
              child: TextFormField(
                controller: keyword,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      notes = searchNote();
                    });
                  } else {
                    setState(() {
                      notes = getAllNotes();
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/icons/Search.svg'),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: FutureBuilder<List<NoteModel>>(
                future: notes,
                builder: (BuildContext context,
                    AsyncSnapshot<List<NoteModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return const Center(child: Text("No Notes"));
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    final items = snapshot.data ?? <NoteModel>[];
                    return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemCount: items.length,
                        itemBuilder: (context, index) => Card(
                            color: const Color(0xff9DCFFF).withOpacity(0.9),
                            margin: const EdgeInsets.all(15),
                            child: ListTile(
                              title: Text(items[index].noteTitle),
                              subtitle: Text(DateFormat("yMd").format(
                                  DateTime.parse(items[index].createdAt))),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  db
                                      .deleteNote(items[index].noteId!)
                                      .whenComplete(() {
                                    _refresh();
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  title.text = items[index].noteTitle;
                                  content.text = items[index].noteContent;
                                });
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  db
                                                      .updateNote(
                                                      title.text,
                                                      content.text,
                                                      items[index].noteId)
                                                      .whenComplete(() {
                                                    _refresh();
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: const Text(
                                                    "Update",
                                                  style: TextStyle(
                                                    color: Colors.blueAccent
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                    "Cancel",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                  )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                        title: const Text("Update Note"),
                                        content: Column(
                                            mainAxisSize: MainAxisSize.min,
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
                                            ]),
                                      );
                                    });
                              },
                            )
                          )
                        );
                  }
                },
              ),
            ),
          ],
        ));
  }
}