import 'package:flutter/material.dart';
import 'package:proconnect_app/views/colors/app_colors.dart';

import '../models_ui/model_ui_profil.dart';

class PageAcceuil extends StatelessWidget {

  final List<Map<String, String>> offresEmploi = const [
    {
      "titre": "Développeur Web Junior",
      "entreprise": "Entreprise XYZ",
      "localisation": "Yaoundé",
    },
    {
      "titre": "Designer UI/UX",
      "entreprise": "TechArt",
      "localisation": "Douala",
    },
    {
      "titre": "Ingénieur Machine Learning",
      "entreprise": "AI Labs",
      "localisation": "Paris",
    },
    {
      "titre": "Administrateur Système",
      "entreprise": "SysCorp",
      "localisation": "Lyon",
    },
  ];
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 10),
                  child: Text('Bienvenue!' , style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,), textAlign: TextAlign.start,),
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
                  padding: const EdgeInsets.only(left: 3,right: 3),
                  child: Wrap(
                   spacing: 3,
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
                // Section : Offres récentes
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "🧑‍💻 Offres d'emploi récentes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: offresEmploi.length,
                    itemBuilder: (context, index) {
                      final offre = offresEmploi[index];
                      return Container(
                        width: 230,
                        margin: const EdgeInsets.only(right: 12),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  offre["titre"]!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "${offre["entreprise"]} - ${offre["localisation"]}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text("Voir" , style: TextStyle(color: AppColors.primaryColor)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Section : Notifications
                const Text(
                  "🔔 Notifications récentes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.mail , color: AppColors.primaryColor,),
                    title:
                    const Text("Vous avez été présélectionné pour un entretien"),
                    subtitle: const Text("Il y a 2 heures"),
                    onTap: () {},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.message,color: AppColors.primaryColor,),
                    title: const Text("Une entreprise vous a envoyé un message"),
                    subtitle: const Text("Il y a 1 jour"),
                    onTap: () {},
                  ),
                ),
            SizedBox(height: 24,),
                // Section : Suggestions
                const Text(
                  "✨ Suggestions pour vous",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    title: const Text("Développeur Flutter à distance"),
                    subtitle: const Text("DevStart - Télétravail"),
                    trailing: TextButton(
                      child: Text("Postuler" , style: TextStyle(color: AppColors.primaryColor),),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text("🤝 Collaborer avec d'autre informaticiens",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                ProfileTile(name: 'Sarah Dupont', role: 'Développeur'),
                ProfileTile(name: 'Jean Martin', role: 'Ingénieur Logiciel'),
                ProfileTile(name: 'Marie Leblanc', role: 'Développeur Web'),
                ProfileTile(name: 'Ruth LeNoir', role: 'Développeur Web'),
                ProfileTile(name: 'Marc DuBoir', role: 'Développeur Web'),
              ],
            ),
          ),
        ),
    );
  }
}
