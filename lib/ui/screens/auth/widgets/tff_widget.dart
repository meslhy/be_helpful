import 'package:be_helpful/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


class CustomTextFormField extends StatelessWidget {
  String hintText ;
  bool isPassword ;
  bool isVisible ;
  TextEditingController controller ;
  String? Function(String?)? validator;
  TextInputType type ;
  IconButton? icon ;
  bool isRight ;


  CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.validator ,
    required this.type ,
     this.icon ,
     this.isVisible = false,
    this.isRight = false

  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.bold
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor:Colors.white.withOpacity(.91),
        hintText: hintText,
        hintStyle:  const TextStyle(
          color: AppColors.grey ,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
          borderSide: const BorderSide(width: 0 , color:AppColors.grey ),
        ),
        suffixIcon: isPassword? icon: null,
      ),
      obscureText:isVisible,
      textAlign: isRight?TextAlign.right:TextAlign.left,
      validator: validator,
    );
  }
}