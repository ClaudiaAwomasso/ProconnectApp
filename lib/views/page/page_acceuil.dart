import 'package:flutter/material.dart';
import 'package:proconnect_app/views/colors/app_colors.dart';

import '../models_ui/model_ui_profil.dart';

class PageAcceuil extends StatelessWidget {
  final List<String> filtres = ['Compétences','Localisation','Expérience'];
  PageAcceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        leading: Icon(Icons.work_outlined,size: 30, ),
        title: Text('Proconnect', style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings,size: 30,))
        ],
      ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 10),
                child: Text('Bienvenue!', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,), textAlign: TextAlign.start,),
              ),
           //   SizedBox(height: 10,),
              // Champ de recherche
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Compétences, localisation, expérience...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              // Filtres
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5),
                child: Wrap(
                  spacing: 6.0,
                  children: filtres.map((filtre){
                return Chip(
                label: Text(filtre),
                backgroundColor: Colors.blue.shade50,
                labelStyle: TextStyle(color: AppColors.primaryColor),
                  side:BorderSide.none ,
                );
                }).toList()
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Profils mis en avant', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),

              SizedBox(height: 10,),
              // Liste de profil
              ProfileTile(name: 'Sarah Dupont',role: 'Développeur',),
              ProfileTile(name: 'Jean Martin', role: 'Ingénieur Logiciel'),
              ProfileTile(name: 'Marie Leblanc', role: 'Développeur Web'),
              ProfileTile(name: 'Ruth LeNoir', role: 'Développeur Web'),
              ProfileTile(name: 'Marc DuBoir', role: 'Développeur Web'),

            ],
          ),
        ),
    );
  }
}
