import 'package:flutter/material.dart';
import 'package:proconnect_app/views/colors/app_colors.dart';
import 'package:proconnect_app/views/models_ui/App_text_field.dart';
import 'package:proconnect_app/views/page/profil_page.dart';

class PortfolioPage extends StatefulWidget {
  PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final List<String> villes = ['Cotonou', 'Abomey calavi', 'Abidjan', 'Bouaké'];

  final List<String> allSkills = [
    'HTML', 'CSS', 'JavaScript', 'Flutter', 'Dart', 'PHP', 'Laravel',
    'React', 'Python', 'Node.js'
  ];
  List<String> filteredSkills = [];
  List<String> selectedSkills = [];

  // Controllers pour récupérer les infos
  TextEditingController nomController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController skillController = TextEditingController();

  String? villeSelectionnee;

  void updateSuggestions(String value) {
    setState(() {
      filteredSkills = allSkills
          .where((skill) =>
      skill.toLowerCase().contains(value.toLowerCase()) &&
          !selectedSkills.contains(skill))
          .toList();
    });
  }

  void addSkill(String skill) {
    if (!selectedSkills.contains(skill)) {
      setState(() {
        selectedSkills.add(skill);
        skillController.clear();
        filteredSkills = [];
      });
    }
  }

  void removeSkill(String skill) {
    setState(() {
      selectedSkills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        title: Text('Proconnect'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Créer votre Portfolio',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Informations personnelles',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              ModelTextField(
                controller: nomController,
                hintText: 'Nom',
              ),
              ModelTextField(
                controller: professionController,
                hintText: 'Profession',
              ),
              ModelTextField(
                controller: contactController,
                hintText: 'Contact',
              ),
              ModelTextField(
                controller: emailController,
                hintText: 'email',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  borderRadius: BorderRadius.circular(15),
                  hint: Text('Sélectionnez votre ville'),
                  value: villeSelectionnee,
                  items: villes
                      .map((ville) => DropdownMenuItem(
                    value: ville,
                    child: Text(ville),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      villeSelectionnee = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Compétences et techniques',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Tags sélectionnés
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: selectedSkills
                    .map(
                      (skill) => Chip(
                    backgroundColor: AppColors.primaryColor,
                    label: Text(
                      skill,
                      style: TextStyle(color: Colors.white),
                    ),
                    deleteIcon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onDeleted: () => removeSkill(skill),
                  ),
                )
                    .toList(),
              ),
              SizedBox(height: 10),
              TextField(
                controller: skillController,
                decoration: InputDecoration(
                  labelText: 'Tapez une compétence',
                  border: OutlineInputBorder(),
                ),
                onChanged: updateSuggestions,
                onTap: () => updateSuggestions(skillController.text),
              ),
              SizedBox(height: 5),
              if (filteredSkills.isNotEmpty)
                Container(
                  height: 150,
                  child: ListView.builder(
                    itemCount: filteredSkills.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredSkills[index]),
                        onTap: () => addSkill(filteredSkills[index]),
                      );
                    },
                  ),
                ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (nomController.text.isNotEmpty &&
                        professionController.text.isNotEmpty &&
                        contactController.text.isNotEmpty &&
                        villeSelectionnee != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            nom: nomController.text,
                            profession: professionController.text,
                            contact: contactController.text,
                            email: emailController.text,
                            ville: villeSelectionnee!,
                            competences: selectedSkills,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Veuillez remplir tous les champs')),
                      );
                    }
                  },
                  child: Text('Crée'),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
