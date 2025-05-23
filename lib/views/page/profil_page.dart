import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proconnect_app/views/colors/app_colors.dart';
import 'package:proconnect_app/views/images_path/images_path.dart';
import 'package:permission_handler/permission_handler.dart';  // <-- correction ici

class ProfilePage extends StatefulWidget {
  final String nom;
  final String email;
  final String profession;
  final String contact;
  final String ville;
  final List<String> competences;

  ProfilePage({
    required this.nom,
    required this.email,
    required this.profession,
    required this.contact,
    required this.ville,
    required this.competences,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;

  Future<void> _pickImage() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Permission stockage refusée')),
        );
        return;
      }
    }

    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Profil Utilisateur' ,),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      : AssetImage(ImagesPath.imagesperson) as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: _pickImage,
                      tooltip: 'Changer la photo de profil',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(' ${widget.nom}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(' ${widget.profession}', style: TextStyle(fontSize: 18)),
                  Text(' ${widget.ville}', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 20),
           Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text('Information personnelles', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
             ),
             ListTile(
               leading: Icon(Icons.mail_outline),
               title: Text('${widget.email}',style: TextStyle(fontSize: 18), ),
             ),
             ListTile(
               leading:Icon(Icons.phone) ,
               title: Text('${widget.contact}', style: TextStyle(fontSize: 18),
             )
             )
           ],
           ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Compétences :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: widget.competences
                  .map(
                    (skill) => Chip(
                  backgroundColor: AppColors.primaryColor,
                  label: Text(skill, style: TextStyle(color: Colors.white)),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
