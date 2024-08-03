import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'edit_profile/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "ProfileScreen";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 70.0,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/100',
                    ), // Replace with your image URL
                  ),
                  const SizedBox(height: 10.0),
                  Column(
                    children: [
                      const Text(
                        'Mona Ali',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // ElevatedButton.icon(
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const AddPostScreen(),
                      //       ),
                      //     );
                      //   },
                      //   icon: const Icon(Icons.add),
                      //   label: const Text(
                      //     'إضافة منشور',
                      //     style: TextStyle(
                      //       fontSize: 18.0,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(12.0),
                      //     ),
                      //     minimumSize: const Size(200, 50),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                  fixedSize: const Size(200, 30),
                ),
                child: const Text(
                  'تعديل الملف الشخصي',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const Divider(
                height: 40.0,
                thickness: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://via.placeholder.com/400',
                      // Replace with your image URL
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'دراجة ابني معدشي بيستخدمها لو حد محتاجها',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'الوصف',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'الماركة: ',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'PHILIPS',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'المادة: ',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'المونيوم',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'اللون: ',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'اسود',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'اخري: ',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'بها عطل في الفرامل الأماميه',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(MdiIcons.shoeSneaker, color: Colors.grey),
                            const SizedBox(width: 5),
                            const Text(
                              'شنط وأحذية',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(Icons.watch_later_outlined,
                                color: Colors.grey),
                            SizedBox(width: 5),
                            Text(
                              'منذ شهرين',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
