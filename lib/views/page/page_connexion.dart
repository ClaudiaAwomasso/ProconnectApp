

import 'package:flutter/material.dart';
import 'package:proconnect_app/views/colors/app_colors.dart';
//import 'package:proconnect_app/views/images_path/images_path.dart';
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
      ),
        body: Container(
          //  width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.primaryColor
          ),
          child: ListView(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding:  EdgeInsets.only(top: 15),
                child: Text( textAlign:TextAlign.center, 'ProConnect',style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),),
              ),
              SizedBox(height: 25,),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                ),
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    // email
                    ModelTextField(
                      // keyboardType: TextInputType.name,
                      controller: emailController,
                      hintText: 'Email',
                      labelText: Text('Email', style: TextStyle(color: Colors.black),),
                      textInputAction: TextInputAction.next,
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
                            // style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(AppColors.primaryColor)),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ProconnectHome()));
                            },
                            child: Text("Se connecter",style: TextStyle(color: Colors.white,fontSize: 15),)
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
                                Image(image: AssetImage("assets/images/github.png", ) ,height: 30,),
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

                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}


