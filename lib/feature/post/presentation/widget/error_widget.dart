import 'package:flutter/material.dart';



class ErrorsWidget extends StatelessWidget {
  final String massage;
   ErrorsWidget({super.key,required this.massage});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),

     child: Center(child: Text(massage.toString()),),
    );
  }
}
