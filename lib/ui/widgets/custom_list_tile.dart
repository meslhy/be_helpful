import 'package:flutter/material.dart';

Widget customListTile(
{
  required String txt,
  required IconData icon,
  required void Function() function,
}
    ) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        horizontalTitleGap: 75.0,
        onTap:function ,
        leading: Container(
          height: 44,
          width: 36.17,
          color: Colors.grey[300],
          child:  Icon(
            icon,
            color: Colors.black87,
            size: 30.0,
          ),
        ),
        title: Text(
          txt,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 25.0,
          ),
        ),
      ),
    ),
  );
}
