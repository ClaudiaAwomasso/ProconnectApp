import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proconnect_app/views/colors/app_colors.dart';
import '../../providers/auth_provider.dart';
import '../images_path/images_path.dart';
import 'home_apresconnexion.dart';

class PageConnexion extends StatefulWidget {
  const PageConnexion({super.key});

  @override
  State<PageConnexion> createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController motDePasseController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(color: AppColors.primaryColor),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'ProConnect',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Entrez votre email';
                          }
                          final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!regex.hasMatch(value)) {
                            return 'Email invalide';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: motDePasseController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'Mot de passe trop court';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });

                              bool success = await authProvider.login(
                                  emailController.text.trim(),
                                  motDePasseController.text.trim());

                              setState(() {
                                _isLoading = false;
                              });

                              if (success) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      ProconnectHome()),
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Erreur de connexion, veuillez réessayer'),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text(
                            "Se connecter",
                            style: TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),


                      SizedBox(height: 10,),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              // style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(Colors.white),),
                              onPressed: (){},
                              child: Row(
                                children: [
                                  Image(image: AssetImage(ImagesPath.github) ,height: 30,),
                                  SizedBox(width: 10,),
                                  Text('Continuer avec Github',style: TextStyle(color: Colors.black,fontSize: 15),),
                                ],
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),

                                ),
                              ),
                              //  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                              onPressed: (){},
                              child: Row(
                                children: [
                                  Image(image: AssetImage(ImagesPath.linkdin ) ,height: 100,),
                                  SizedBox(width: 10,),
                                  Text('Continuer avec Linkedin',style: TextStyle(color:Colors.black,fontSize: 15),),
                                ],
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Vous n'avez pas de compte ? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/inscription');
                            },
                            child: Text(
                              'Inscrivez-vous',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Tu peux rajouter d'autres boutons de connexion sociale ici si tu veux
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
