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
  File? _image;

  Future<void> _pickImage() async {
    // final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    // if (pickedFile != null) {
    //   setState(() {
    //     _image = File(pickedFile.path);
    //   });
    // }
  }

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
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: _image == null
                        ? const NetworkImage(
                      'https://via.placeholder.com/150',
                    )
                        : FileImage(_image!) as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: _pickImage,
                    ),
                  ),
                ],
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
                          'البريد الإلكتروني',
                          style: TextStyle(
                            fontSize:
                            18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
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
                    Row(
                      children: [
                        Text(
                          'كلمة السر ',
                          style: TextStyle(
                            fontSize:
                            18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 60.0,
                        ),
                        SizedBox(
                            width: 200.0,
                            child: CustomTextField(label: 'الحالية',istrue: true,)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 85.0),
                          child: SizedBox(
                              width: 200,
                              child:
                              CustomTextField(label: 'الجديدة',istrue: true,)),
                        ),
                        SizedBox(
                            width: 200,
                            child:
                            CustomTextField(label: 'تأكيد',istrue: true,)),
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