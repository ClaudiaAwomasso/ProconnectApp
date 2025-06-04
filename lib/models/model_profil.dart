

class UserModel {
  final String nom;
  final String email;
  final String motDePasse;
  final String pays;
  final String ville;
  final List<String> competences;
  final List<String> experiences;
  final String parcoursPro;
  final String role;
  UserModel({
    required this.nom,
    required this.email,
    required this.motDePasse,
    required this.pays,
    required this.ville,
    required this.competences,
    required this.experiences,
    required this.parcoursPro,
    required this.role,
  });
}
