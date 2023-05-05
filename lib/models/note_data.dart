import 'package:flutter/foundation.dart';

import 'note.dart';

class NoteData extends ChangeNotifier {
  List<Note> allNotes = [
    Note(id: 0,
        text: 'Hi Welcome Guys this is the First Note ! Please Enjoy the App. If yiu have any suggestions please leave them'),
  ];

  List<Note> getAllNotes() {
    return allNotes;
  }

  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  void updateNote(Note note, String text) {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].text == text;
      }
    }
    notifyListeners();
  }

  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}