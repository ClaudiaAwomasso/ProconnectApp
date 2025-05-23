import 'package:flutter/material.dart';
class ProfileTile  extends StatelessWidget {
  final String name;
  final String role;
  const ProfileTile ({super.key, required this.name, required this.role});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/avatar.png'),
      ),
      title: Text(name,style: TextStyle(fontWeight: FontWeight.bold,),
    ),
        subtitle: Text(role),
    );
  }
}
