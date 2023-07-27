import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              'Friendly Wallet',
            style: GoogleFonts.oxygen(
                color: Colors.brown.shade300,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromRGBO(250, 240, 202, 1),
      ),
      body: Text('Wallet Page'),

      bottomNavigationBar: Container(
        color: const Color.fromRGBO(250, 237, 205, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            haptic: true,
            tabShadow: [
              BoxShadow(color: Colors.brown.withOpacity(0.2), blurRadius: 8)
            ],
            selectedIndex: _selectedIndex = 1,
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
                  text: 'Wallet',
              ),
              GButton(
                  icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
