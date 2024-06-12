import 'package:flutter/material.dart';

final appTheme=  ThemeData(
  primaryColor:Colors.indigo ,
 // useMaterial3: true,
  appBarTheme:const  AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.red,
    ),
    titleSpacing: 0.5,
  ),
  brightness: Brightness.light,
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 0.5,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(error: Colors.deepOrange),
);