import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  String name;
  bool multylins;
 TextEditingController controller;

   TextFormFieldWidget({super.key,required this.name,
     required this.multylins,
     required this.controller
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: TextFormField(
        style: TextStyle(
          fontWeight: multylins?FontWeight.normal:FontWeight.bold
        ),
        validator: (val)=>val!.isEmpty?'Cant $name send empty data':null,
        controller: controller,
        maxLines: multylins?6:1,
        minLines: multylins?6:1,
        decoration: InputDecoration(

          hintText: name,
          border: OutlineInputBorder(

          )
        ),
      ),
    );
  }
}
