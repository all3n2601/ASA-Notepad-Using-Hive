import 'package:asa_notepad/models/note_data.dart';
import 'package:asa_notepad/pages/settings_page.dart';
import 'package:asa_notepad/pages/wallet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import 'editing_page.dart';
import 'main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget Function()> _pages = [
        ()=>MainPage(),
        ()=>WalletPage(),
        ()=>SettingsPage()
  ];
  @override
  void initState() {
    super.initState();
    Provider.of<NoteData>(context, listen: false).initializeAllNotes();
  }

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
            isNewNote: isNewNote,
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
          hoverElevation: 25,
          onPressed: createNewNote,
          backgroundColor: Colors.brown,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Friendly Notes',
              style: GoogleFonts.oxygen(
                  color: Colors.brown.shade300,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: const Color.fromRGBO(250, 240, 202, 1),
        ),
        body: _pages[_selectedIndex](),
        bottomNavigationBar: Container(
          color: const Color.fromRGBO(250, 237, 205, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              haptic: true,
              tabShadow: [
                BoxShadow(color: Colors.brown.withOpacity(0.2), blurRadius: 8)
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              curve: Curves.easeInCubic,
              backgroundColor: const Color.fromRGBO(250, 240, 202, 1),
              color: Colors.white,
              activeColor: Colors.brown,
              tabBackgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
              tabs: [
                GButton(
                  icon: Icons.note_add_sharp,
                  text: 'Notes',
                ),
                GButton(
                    icon: Icons.account_balance_wallet,
                    text: 'Wallet'),
                GButton(
                    icon: Icons.settings,
                    text: 'Settings'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
