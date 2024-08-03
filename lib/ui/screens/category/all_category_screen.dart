import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widgets/custom_list_tile.dart';

class AllCategories extends StatelessWidget {
  static const String routeName = "AllCategories";
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'كل الأصناف',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 25.0,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 18.0,
          ),
          customListTile(
              txt: 'أدوات تعليمية',
              icon: Icons.menu_book_outlined,
              function: () {}),
          customListTile(
            txt: 'إلكترونيات',
            icon: Icons.device_hub_outlined,
            function: () {},
          ),
          customListTile(
            txt: 'إكسسوارات',
            icon: Icons.watch,
            function: () {},
          ),
          customListTile(
            txt: 'أجهزة منزلية',
            icon: Icons.tv,
            function: () {},
          ),
          customListTile(
            txt: 'ملابس',
            icon: MdiIcons.tshirtV,
            function: () {},
          ),
          customListTile(
            txt: 'ترفيه وتسلية',
            icon: Icons.sports_esports_outlined,
            function: () {},
          ),
          customListTile(
            txt: 'شنط وأحذية',
            icon: MdiIcons.shoeSneaker,
            function: () {},
          ),
          customListTile(
            txt: 'أثاث وديكور',
            icon: Icons.chair_outlined,
            function: () {},
          ),
          customListTile(
            txt: 'أدوات رياضية',
            icon: Icons.sports_soccer_outlined,
            function: () {},
          ),
        ],
      ),
    );
  }
}
