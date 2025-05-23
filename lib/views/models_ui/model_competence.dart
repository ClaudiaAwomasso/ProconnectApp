import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
class ModelCompetence extends StatelessWidget {
   final  TextCompetence item;
  const ModelCompetence( {super.key,  required this.item});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(item.nameCompetence, style: TextStyle(color: AppColors.primaryColor),),
      ),
      onPressed: (){},
    );
  }
}
//modèl ui
 class TextCompetence {
   String nameCompetence;

   TextCompetence({
     required this.nameCompetence,

   });
 }