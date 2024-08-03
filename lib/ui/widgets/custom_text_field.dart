import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final bool isDescription;
  final bool istrue;
  const CustomTextField({
    super.key,
    this.label,
    this.icon,
    this.isDescription = false,
    required this.istrue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: istrue,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon,color: Colors.black,),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
        ),
      ),
    );
  }
}
