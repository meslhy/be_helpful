import 'package:flutter/material.dart';

import 'dart:io';

import '../../widgets/custom_text_field.dart';

class AddPostScreen extends StatefulWidget {
  static const String routeName = "AddPostScreen";
  const AddPostScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
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
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
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
                'اضافة منشور',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150',
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                'Mona Ali',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.image),
                      title: const Text('إضافة صورة'),
                      onTap: _pickImage,
                    ),
                    if (_image != null)
                      Image.file(
                        _image!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    const CustomTextField(
                      label: 'إضافة نص',
                      icon: Icons.edit,
                      istrue: false,
                    ),
                    const CustomTextField(
                      label: 'إضافة عنوان',
                      icon: Icons.title,
                      istrue: false,
                    ),
                    const CustomTextField(
                      label: 'إضافة الصنف',
                      icon: Icons.folder_copy_outlined,
                      istrue: false,
                    ),
                    const CustomTextField(
                      label: 'إضافة وصف',
                      icon: Icons.description,
                      isDescription: true,
                      istrue: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))),
                onPressed: () {},
                child: const Text(
                  'أنشر',
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

