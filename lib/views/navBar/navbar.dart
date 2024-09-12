import 'package:flutter/material.dart';

import 'package:moviezilla/views/tv/tv.dart';

import '../../utlis/colors.dart';
import '../movie/movie.dart';


class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  List<Widget> screen=[
   const MovieScreen(),
    const TvScreen(),

  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          unselectedItemColor: Colors.white.withOpacity(0.6),
          showUnselectedLabels: true,
          // showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.movie),
                icon: Icon(Icons.movie_creation_outlined), label: "Movie"),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.connected_tv),
                icon: Icon(Icons.tv),
                label: "TV"),
          ]),
    );
  }
}
