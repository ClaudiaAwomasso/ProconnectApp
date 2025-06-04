

import 'package:flutter/material.dart';
import 'package:proconnect_app/views/colors/app_colors.dart';
import 'package:proconnect_app/views/images_path/images_path.dart';
//import 'package:pro_connect/views/page/page_example.dart';

import '../models_ui/App_text_field.dart';
import 'home_apresconnexion.dart';


class PageConnexion extends StatefulWidget {
  const PageConnexion ({super.key});
  @override
  State<PageConnexion> createState() => _PageConnexionState();
}
class _PageConnexionState extends State<PageConnexion> {
  TextEditingController controller = TextEditingController();
  TextEditingController motDePasseController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? _selectedRole;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        title: Text('Proconnet'),

      ),
      body:Container(
        // decoration: BoxDecoration(color: Colors.amberAccent),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child:Stack(
            children:[

              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // ... le reste de ton contenu

                        SizedBox(height: 20),
                        // email
                        ModelTextField(
                          // keyboardType: TextInputType.name,
                          controller: emailController,
                          hintText: 'Email',
                          labelText: Text('Email', style: TextStyle(color: Colors.black),),
                        ),
                        SizedBox(height: 2,),
                        // mot de passe
                        ModelTextField(
                          // keyboardType: TextInputType.name,
                          controller: motDePasseController,
                          hintText: 'Mot de passe',
                          labelText: Text('Mot de passe', style: TextStyle(color: Colors.black),),
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 15),
                          child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ProconnectHome()));
                                },
                                child: Text('Se connecter',style: TextStyle(color: Colors.white,fontSize: 16),)
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
                        SizedBox(height: 10,),
                        TextButton(onPressed: (){}, child: Text('Mot de passe oublié ?',style: TextStyle(color: AppColors.primaryColor),)),
                        SizedBox(height: 30,)
                      ],

                    ),
                  ),
                ),
              ),
            ]
        ),

      ),
    );

  }
}








import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:proconnect_app/views/colors/app_colors.dart';
import 'package:proconnect_app/views/images_path/images_path.dart';
import 'package:proconnect_app/views/page/page_conditiongénérales.dart';
import '../models_ui/App_text_field.dart';
import 'home_apresconnexion.dart';

class PageInscription extends StatefulWidget {
  const PageInscription ({super.key});

  @override
  State<PageInscription> createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  TextEditingController controller = TextEditingController();
  TextEditingController motDePasseController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController emailCotroller= TextEditingController();
  String? _selectedRole;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Container(
          //  width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.primaryColor
          ),
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding:  EdgeInsets.only(top: 15),
                child: Text( textAlign:TextAlign.center, 'ProConnect',style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                ),
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    // nom et prenom
                    ModelTextField(
                      // keyboardType: TextInputType.name,
                      controller: nomController,

                      //   hintText: 'Entrez votre nom et prénom',
                      labelText: Text('Nom et prénom', style: TextStyle(color: Colors.black),),
                    ),
                    ModelTextField(
                      // keyboardType: TextInputType.name,
                      controller: emailCotroller,
                      hintText: 'Email',
                      labelText: Text('Email', style: TextStyle(color: Colors.black),),
                    ),
                    // SizedBox(height: 5),

                    // mot de passe
                    ModelTextField(

                      // keyboardType: TextInputType.name,
                      controller: motDePasseController,

                      hintText: 'Mot de passe',
                      labelText: Text('Mot de passe', style: TextStyle(color: Colors.black),),
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    //   Type de profil

                    RadioListTile<String>(
                      title: Text("Recruteur", style: TextStyle(color: Colors.black),),
                      value: "Recruteur",
                      activeColor: AppColors.primaryColor,
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value;
                        });
                      },
                    ),
                    //   Type de profil
                    RadioListTile<String>(
                      title: Text("Talent", style: TextStyle(color: Colors.black),),
                      value: "Talent",
                      activeColor: AppColors.primaryColor,
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value;
                        });
                      },
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15),
                      child: SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            // style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(AppColors.primaryColor)),
                            onPressed: (){ Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ProconnectHome()));
                            },
                            child: Text("S'inscrire",style: TextStyle(color: Colors.white,fontSize: 15),)
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            // style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(Colors.white),),
                            onPressed: (){},
                            child: Row(
                              children: [
                                Image(image: AssetImage(ImagesPath.github ) ,height: 30,),
                                SizedBox(width: 10,),
                                Text(" S'inscrire via Github",style: TextStyle(color: Colors.black,fontSize: 15),),
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: (){},
                            child: Row(
                              children: [
                                Image(image: AssetImage("assets/images/linkdin.webp", ) ,height: 100,),
                                SizedBox(width: 10,),
                                Text("S'incrire via Linkedin",style: TextStyle(color:Colors.black,fontSize: 15),),
                              ],
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                          text: "En vous inscrivant, vous acceptez les ",
                          style: const TextStyle(color: Colors.black54, fontSize: 12),
                          children: [
                            TextSpan(
                              text: "Conditions générales d'utilisation",
                              style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                // Navigue vers la page CGU ici
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PageConditionsGenerales()),
                                );
                              },
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),

            ],

          ),
        )
    );
  }
}






