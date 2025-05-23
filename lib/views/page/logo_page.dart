import 'package:flutter/material.dart';
import 'package:proconnect_app/views/page/home_page.dart';
import '../images_path/images_path.dart';
class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(
            height: MediaQuery.of(context).size.height * 0.25,
            ImagesPath.symbol,
          ),
        ),
      ),
    );
  }
}
