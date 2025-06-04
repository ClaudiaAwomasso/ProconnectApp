import 'package:flutter/material.dart';
import 'package:proconnect_app/views/colors/app_colors.dart';
import 'package:proconnect_app/views/images_path/images_path.dart';
import 'package:proconnect_app/views/page/page_connexion.dart';
import 'package:proconnect_app/views/page/page_inscription.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
    SizedBox( height: MediaQuery.of(context).size.height * 0.03,
    ),
            SizedBox(height: 10,),
                  Image(
                    width: MediaQuery.of(context).size.width *10,
                 //   width: 300,
                    image: AssetImage(
                      ImagesPath.imagesperson
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' Proconnect , portfolio professionel',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Crée facilement ton parcours, valorise tes compétences, et laisse les recruteurs te trouver.",
                        style: TextStyle(
                          color: Colors.black,

                        ),
                      ),
                      SizedBox(
                       //  height: MediaQuery.of(context).size.height * 0.025
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(AppColors.primaryColor),
                          ),
                          onPressed: () {
                           // Navigator.pushNamed(context, '/inscription');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PageInscription()));
                          },
                          child: Text(
                            "Inscrivez-vous",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 80,),
                              Text(
                                  textAlign: TextAlign.center,'Aviez-vous déjà un compte?'),
                              TextButton(onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => PageConnexion()));
                              }, child:Text('Connectez-vous',style: TextStyle(color: AppColors.primaryColor),) )
                            ]
                          ),
                        ),
                      )
                    ],

                  ),

                ],

              ),
            ),
          ],
        ),
      );

  }
}
