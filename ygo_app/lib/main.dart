import 'package:flutter/material.dart';
import 'calc.dart';

void main() {
  runApp(MaterialApp(
      title: 'Probability Calculator',
      // themeMode: ThemeMode.system,
      // theme: MyThemes.lightTheme,
      // darkTheme: MyThemes.darkTheme,
      darkTheme: ThemeData().copyWith(
        backgroundColor: Colors.black,
      ),
      home: const CalcPage()));
}
