import 'package:flutter/material.dart';
import 'dart:io';

import '../../../widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = "EditProfileScreen";
  const EditProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'تعديل الملف الشخصي',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'الإسم',
                          style: TextStyle(
                            fontSize:
                            18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 85.0,
                        ),
                        SizedBox(
                            width: 200.0,
                            child: CustomTextField(istrue: false,)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'رقم الهاتف',
                          style: TextStyle(
                            fontSize:
                            18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 55.0,
                        ),
                        SizedBox(
                            width: 200.0,
                            child: CustomTextField(istrue: false,)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                onPressed: () {},
                child: const Text(
                  'حفظ التعديلات',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}