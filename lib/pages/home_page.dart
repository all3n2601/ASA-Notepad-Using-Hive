import 'package:asa_notepad/models/note_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import 'editing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void createNewNote() {
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;

    Note newNote = Note(
      id: id,
      text: '',
    );

    goToNotePage(newNote, true);
  }

  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditingNotePage(
            note: note,
            isNewNote: false,
          ),
        ));
  }

  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewNote,
          child: Icon(
            Icons.add,
            color: Colors.grey,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                'Notes',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            CupertinoListSection.insetGrouped(
              children: List.generate(
                  value.getAllNotes().length,
                  (index) => CupertinoListTile(
                        title: Text(value.getAllNotes()[index].text),
                        onTap:() => goToNotePage(value.allNotes[index], false),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
