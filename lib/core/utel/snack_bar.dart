import 'package:flutter/material.dart';

class SnackBarClass{

  SuccessfullSnackBar(BuildContext context,String massage){
    return ScaffoldMessenger.of(context).showSnackBar(
   SnackBar(
     backgroundColor: Colors.green,
       content: Text(massage.toString(),style: TextStyle(
         color: Colors.white,
       ),
       ),

   ),

    );
  }

  ErrorSnackBar(BuildContext context,String massage) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(massage.toString(), style: TextStyle(
          color: Colors.white,

        ),
        ),

      ),

    );
  }

}