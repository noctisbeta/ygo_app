import 'package:flutter/material.dart';
import 'package:ygo_app/lp_page.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
      title: 'Probability Calculator',
      // themeMode: ThemeMode.system,
      // theme: MyThemes.lightTheme,
      // darkTheme: MyThemes.darkTheme,
      darkTheme: ThemeData().copyWith(
        backgroundColor: Colors.black,
      ),
      home: const LifePage()));
}
