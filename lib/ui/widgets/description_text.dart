import 'package:be_helpful/ui/utils/app_colors.dart';
import 'package:be_helpful/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';

class CustomDescriptionText extends StatelessWidget {
  String text;
   CustomDescriptionText({super.key,this.text =""});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: AppTheme.lightTheme.textTheme.labelLarge?.fontSize ?? 15,
        fontWeight: AppTheme.lightTheme.textTheme.labelLarge?.fontWeight ?? FontWeight.w600,
        color: AppColors.grey
      ),
      textAlign: TextAlign.right,
    );
  }
}
