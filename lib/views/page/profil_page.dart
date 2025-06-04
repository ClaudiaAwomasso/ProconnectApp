
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proconnect_app/providers/user_provider.dart';

import '../colors/app_colors.dart';

class PageProfil extends StatefulWidget {
  const PageProfil ({super.key});

  @override
  State<PageProfil> createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor, // 🔵 la couleur de ton AppBar
        statusBarIconBrightness: Brightness.light, // blanc si ta status bar est foncée
      ),
    );
  }

  @override

  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Profil")),
        body: const Center(child: Text("Aucun utilisateur connecté.")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        title: const Text("Profil",),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
           ListTile(
             title:Text('Informations personnelles' , style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primaryColor,),) ,
               trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit,))
           ),
           ListTile(
               title: const Text("Nom", style: TextStyle(fontWeight: FontWeight.w500,),),
               subtitle: Text(user.nom),
           ),
           ListTile(
             title: const Text("Email", style: TextStyle(fontWeight: FontWeight.w500),),
             subtitle: Text(user.email),
           ),
           ListTile(
             title: const Text("Pays", style: TextStyle(fontWeight: FontWeight.w500),),
             subtitle: Text(user.pays),
           ),
           ListTile(
             title: const Text("Ville",style: TextStyle(fontWeight: FontWeight.w500),),
             subtitle: Text(user.ville),
           ),
            Divider(),
            ListTile(
                title:Text('Informations professionnelles' , style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primaryColor,fontSize: 15),) ,
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit,))
            ),
            ListTile(
              title: const Text("Compétences", style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: Text(user.competences.join(", ")),

            ),
            ListTile(
              title: const Text("Expériences",style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: Text(user.experiences.join(", "))
            ),
            Divider(),
            ListTile(
              title: Text("Parcours professionnel", style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.primaryColor ),),
              subtitle: Text(user.parcoursPro),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit,))
            ),
          ],
        ),
      ),
    );
  }
}

