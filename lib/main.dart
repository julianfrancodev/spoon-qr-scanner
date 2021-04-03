import 'package:flutter/material.dart';
import 'package:qrscanner_v2/src/pages/home_page.dart';
import 'package:qrscanner_v2/src/pages/map_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "QR Reader",
    initialRoute: 'home',
    routes: {
      "home": (_) => HomePage(),
      "map": (_) => MapPage(),
    },
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrangeAccent
      )
    ),
  ));
}
