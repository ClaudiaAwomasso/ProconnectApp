import 'package:flutter/material.dart';
import 'package:proconnect_app/views/page/logo_page.dart';
import 'package:proconnect_app/views/page/page_connexion.dart';
import 'package:proconnect_app/views/page/page_inscription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:  PageInscription(),
      initialRoute: '/',
      routes: {
        '/': (context) => LogoPage(),
        '/inscription': (context) => PageInscription(),
        '/connexion': (context) => PageConnexion()
      },
    );
  }
}

