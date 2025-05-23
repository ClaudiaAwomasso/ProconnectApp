import 'package:flutter/material.dart';

class ModelTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  const ModelTextField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
          keyboardType: TextInputType.visiblePassword,
          controller: controller,
          decoration: InputDecoration(

              prefixIcon: prefixIcon,
              label: labelText,
              hintText: hintText,
              suffixIcon: suffixIcon ?? SizedBox(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10), // Bordure arrondie
           //   borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0), // Bordure arrondie au focus
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
          ),
      textInputAction: textInputAction,
      ),
    );
  }
}
