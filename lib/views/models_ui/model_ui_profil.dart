import 'package:flutter/material.dart';
import 'package:proconnect_app/views/images_path/images_path.dart';
class ProfileTile  extends StatelessWidget {
  final String name;
  final String role;
  //final String imageProfil;
  const ProfileTile ({super.key, required this.name, required this.role});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(ImagesPath.imagesperson),
      ),
      title: Text(name,style: TextStyle(fontWeight: FontWeight.bold,),
    ),
        subtitle: Text(role),
    );
  }
}
