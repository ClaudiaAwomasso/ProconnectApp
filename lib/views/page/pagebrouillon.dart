

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


