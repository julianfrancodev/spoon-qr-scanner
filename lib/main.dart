import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_v2/src/pages/home_page.dart';
import 'package:qrscanner_v2/src/pages/map_page.dart';
import 'package:qrscanner_v2/src/providers/ui_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
    child: MaterialApp(
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
              backgroundColor: Colors.deepOrangeAccent)),
    ),
  ));
}
