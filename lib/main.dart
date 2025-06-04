/*import 'package:flutter/material.dart';
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



*/


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/page/logo_page.dart';
import 'views/page/page_connexion.dart';
import 'views/page/page_inscription.dart';
//import 'views/page/page_profil.dart';
import 'providers/user_provider.dart';
import 'providers/auth_provider.dart'; // <- ajoute l'import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()), // <- ajoute AuthProvider ici
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LogoPage(),
          '/inscription': (context) => const PageInscription(),
          '/connexion': (context) => const PageConnexion(),
          // '/profil': (context) => const PageProfil(),
        },
      ),
    );
  }
}

