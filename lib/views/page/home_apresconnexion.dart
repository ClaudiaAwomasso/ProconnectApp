import 'package:flutter/material.dart';
import 'package:proconnect_app/views/colors/app_colors.dart';
import 'package:proconnect_app/views/page/page_acceuil.dart';

import 'package:proconnect_app/views/page/page_message.dart';
import 'package:proconnect_app/views/page/page_offres.dart';
import 'package:proconnect_app/views/page/portfolio_page.dart';
import 'package:proconnect_app/views/page/profil_page.dart';
class ProconnectHome extends StatefulWidget {
  @override
  State<ProconnectHome> createState() => _ProconnectHomeState();
}

class _ProconnectHomeState extends State<ProconnectHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PageAcceuil(),
      // Pagexemple(),
    PortfolioPage(),
    PageMessage(),
    PageOffres(),
    //ProfilPage()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil' , ),
          BottomNavigationBarItem(icon: Icon(Icons.create_new_folder_rounded), label: 'Créer un portfolio'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Offres d'emploi"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        //  BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Profil'),
        ],
      ),
    );
  }
}
