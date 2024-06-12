import 'package:flutter/material.dart';
class ElevatedButtonWidget extends StatelessWidget {
  String label;
  IconData iconData;
   VoidCallback onpressed;


   ElevatedButtonWidget({super.key,required this.label,
     required this.iconData,
     required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(onPressed: onpressed,
        icon: Icon(iconData),
        label: Text(label.toString()));
  }
}
