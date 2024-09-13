import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviezilla/views/navBar/navbar.dart';


import '../../utlis/text_style.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const CustomNavbar()),
              (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: AppColors.primaryColor,
      backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Ink.image(image: const NetworkImage('https://cdn.pixabay.com/photo/2015/12/09/22/24/filmklappe-1085692_1280.png'),height: Get.height*.15,),

               SizedBox(
                height: Get.height*.015,
              ),
              HeadingTwo(
                data: 'MovieZilla',
                fontSize: Get.height*.035,
              )
            ],
          ),
        ));
  }
}