import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviezilla/views/navBar/navbar.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieZilla',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.black45),
        appBarTheme: const AppBarTheme(centerTitle: true,backgroundColor: Colors.transparent),
        iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)))
      ),
      home: const CustomNavbar()
    );
  }
}

