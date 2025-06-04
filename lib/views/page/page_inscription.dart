import 'package:flutter/material.dart';
import 'package:proconnect_app/views/page/page_recruteur.dart';
import 'package:provider/provider.dart';
import '../../models/model_profil.dart';
import '../../providers/user_provider.dart';
import '../colors/app_colors.dart';
import '../images_path/images_path.dart';
import 'home_apresconnexion.dart';

class PageInscription extends StatefulWidget {
  const PageInscription  ({super.key});

  @override
  State<PageInscription> createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  final nomController = TextEditingController();
  final emailController = TextEditingController();
  final mdpController = TextEditingController();
  final parcoursProController = TextEditingController();
  TextEditingController competenceController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  String? selectedPays;
  String? selectedVille;
  String? _selectedRole;


  List<String> selectedCompetences = [];
  List<String> selectedExperiences = [];

  List<String> filteredCompetences = [];
  List<String> filteredExperiences = [];

  /*List<String> competences = [];
  List<String> experiences = [];*/

  final allCompetences = ['Flutter', 'Laravel', 'React', 'Photoshop','Dart','CSS','Html','Javascript','PHP','Python','Vue.js','Node.js','Wordpress','Bootstrap'];
  final allExperiences = ['Dév mobile', 'Graphisme', 'Web design', 'Marketing','Dev web ',];

  final Map<String, List<String>> villesParPays = {
    'Bénin': ['Cotonou', 'Porto-Novo', 'Parakou', 'Abomey calavi'],
    'Togo': ['Lomé', 'Sokodé'],
    'Burkina Faso': ['Ouagadougou', 'Bobo-Dioulasso'],
    'Côte d\'Ivoire': ['Abidjan', 'Bouaké'],
    'Sénégal': ['Dakar', 'Thiès'],


  };

  @override
  void dispose() {
    nomController.dispose();
    emailController.dispose();
    mdpController.dispose();
    parcoursProController.dispose();
    super.dispose();
  }

  void submit() {
  if (_formKey.currentState!.validate()) {
  if (selectedPays == null || selectedVille == null) {
  ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Veuillez sélectionner votre pays et ville')),
  );
  return;
  }

  if (selectedCompetences.isEmpty || selectedExperiences.isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Veuillez sélectionner compétences et expériences')),
  );
  return;
  }

  if (_selectedRole == null) {
  ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Veuillez sélectionner un type de profil')),
  );
  return;
  }

  final newUser = UserModel(
  nom: nomController.text.trim(),
  email: emailController.text.trim(),
  motDePasse: mdpController.text,
  pays: selectedPays!,
  ville: selectedVille!,
  competences: selectedCompetences,
  experiences: selectedExperiences,
  parcoursPro: parcoursProController.text.trim(),
  role: _selectedRole!, // ✅ Ajout du rôle ici
  );

  Provider.of<UserProvider>(context, listen: false).setUser(newUser);

  // ✅ Redirection selon le rôle sélectionné
  if (_selectedRole == "Recruteur") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PageRecruteur()));
  } else {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProconnectHome()));
  }
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: AppColors.primaryColor
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding:  EdgeInsets.only(top: 10),
                child: Text(textAlign:TextAlign.center, 'ProConnect',style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold,)),
              ),
              SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 25),
                        // Nom complet
                        TextFormField(
                          controller: nomController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: "Nom complet",
                              border: OutlineInputBorder()),
                          validator: (val) => val == null || val.trim().isEmpty ? "Entrez votre nom" : null,
                          style: TextStyle(color: Colors.black),

                        ),
                        SizedBox(height: 10,),
                        // Email
                        TextFormField(
                          controller: emailController,
                          decoration:InputDecoration(
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: "Email" , border: OutlineInputBorder()),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) return "Entrez votre email";
                            final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if (!regex.hasMatch(val)) return "Email invalide";
                            return null;
                          },
                        ),
                            SizedBox(height: 10,),
                        // Mot de passe
                        TextFormField(
                          controller: mdpController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
                            labelStyle: TextStyle(color: Colors.black),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            labelText: "Mot de passe",
                            border: const OutlineInputBorder(),
                          ),
                          obscureText: _obscurePassword,
                          validator: (val) => val == null || val.length < 6
                              ? "Mot de passe trop court (min. 6 caractères)"
                              : null,
                        ),


                        const SizedBox(height: 20),

                        // Pays
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Pays',border: OutlineInputBorder()),
                          value: selectedPays,
                          items: villesParPays.keys.map((pays) {
                            return DropdownMenuItem(value: pays, child: Text(pays));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedPays = value;
                              selectedVille = null;
                            });
                          },
                          validator: (value) => value == null ? 'Veuillez sélectionner un pays' : null,
                        ),
                            SizedBox(height: 15,),
                        // Ville (dépend du pays sélectionné)
                        if (selectedPays != null)
                          DropdownButtonFormField<String>(
                            decoration:InputDecoration(
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
                                labelStyle: TextStyle(color: Colors.black),
                                labelText: 'Ville',border: OutlineInputBorder()),
                            value: selectedVille,
                            items: villesParPays[selectedPays]!.map((ville) {
                              return DropdownMenuItem(value: ville, child: Text(ville));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedVille = value;
                              });
                            },
                            validator: (value) => value == null ? 'Veuillez sélectionner une ville' : null,
                          ),

                        const SizedBox(height: 20),
                        // === COMPÉTENCES ===
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Compétences", style: TextStyle(fontWeight: FontWeight.bold) ,textAlign: TextAlign.start,),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: selectedCompetences
                                .map((skill) => Chip(
                          
                              label: Text(skill),
                              deleteIcon: Icon(Icons.close),
                              onDeleted: () {
                                setState(() {
                                  selectedCompetences.remove(skill);
                                });
                              },
                            ))
                                .toList(),
                          ),
                        ),
                         SizedBox(height: 10,),
                        TextField(
                          controller: competenceController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: 'Ajouter une compétence',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              filteredCompetences = allCompetences
                                  .where((c) => c.toLowerCase().contains(value.toLowerCase()) && !selectedCompetences.contains(c))
                                  .toList();
                            });
                          },
                          onTap: () {
                            setState(() {
                              filteredCompetences = allCompetences
                                  .where((c) => !selectedCompetences.contains(c))
                                  .toList();
                            });
                          },
                        ),
                        if (filteredCompetences.isNotEmpty)
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              itemCount: filteredCompetences.length,
                              itemBuilder: (context, index) => ListTile(
                                title: Text(filteredCompetences[index]),
                                onTap: () {
                                  setState(() {
                                    selectedCompetences.add(filteredCompetences[index]);
                                    competenceController.clear();
                                    filteredCompetences.clear();
                                  });
                                },
                              ),
                            ),
                          ),

                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Expériences", style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),

                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: selectedExperiences
                                .map((exp) => Chip(
                              label: Text(exp),
                              deleteIcon: Icon(Icons.close),
                              onDeleted: () {
                                setState(() {
                                  selectedExperiences.remove(exp);
                                });
                              },
                            ))
                                .toList(),
                          ),
                        ),

                        SizedBox(height: 10,),
                        TextField(
                          controller: experienceController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: 'Ajouter une expérience',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              filteredExperiences = allExperiences
                                  .where((e) => e.toLowerCase().contains(value.toLowerCase()) && !selectedExperiences.contains(e))
                                  .toList();
                            });
                          },
                          onTap: () {
                            setState(() {
                              filteredExperiences = allExperiences
                                  .where((e) => !selectedExperiences.contains(e))
                                  .toList();
                            });
                          },
                        ),
                        if (filteredExperiences.isNotEmpty)
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              itemCount: filteredExperiences.length,
                              itemBuilder: (context, index) => ListTile(
                                title: Text(filteredExperiences[index]),
                                onTap: () {
                                  setState(() {
                                    selectedExperiences.add(filteredExperiences[index]);
                                    experienceController.clear();
                                    filteredExperiences.clear();
                                  });
                                },
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),

                        // Parcours professionnel
                        TextFormField(
                          controller: parcoursProController,
                          maxLines: 5,
                          decoration:  InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: "Parcours professionnel",
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,

                          ),
                          validator: (val) => val == null || val.trim().isEmpty ? "Décrivez votre parcours" : null,
                        ),

                        const SizedBox(height: 20),

                        // --- Nouveau : Choix du type de profil (Recruteur / Talent) ---
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text("Type de profil", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15) ),
                           ],
                         ),
                      SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text("Recruteur", style: TextStyle(color: Colors.black,fontSize: 13)),
                                value: "Recruteur",
                                groupValue: _selectedRole,
                                activeColor: AppColors.primaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRole = value;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text("Talent", style: TextStyle(color: Colors.black,fontSize: 13)),
                                value: "Talent",
                                groupValue: _selectedRole,
                                activeColor: AppColors.primaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRole = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        // Bouton s'inscrire
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 15),
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                // style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(AppColors.primaryColor)),
                                onPressed:submit,
                                child: Text("S'inscrire",style: TextStyle(color: Colors.white,fontSize: 15),)
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(child: Divider(

                              thickness: 1.5,
                            )),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Ou'),
                            ),

                            Expanded(child: Divider(
                              thickness: 1.5,

                            ))
                          ],
                        ),
                         SizedBox(height: 10,),
                        // --- Bouton Linkdin ---
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                              onPressed: () {
                                // TODO: Linkdin Sign-in
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(ImagesPath.linkdin, height: 24),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "S'incrire via Linkedin",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // --- Bouton GitHub ---
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40,
                               width: MediaQuery.of(context).size.width * 0.9,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                              onPressed: () {
                                // TODO: GitHub Sign-in
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/github.png", height: 24),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "S'inscrire avec GitHub",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
