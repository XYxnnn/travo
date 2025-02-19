import 'package:flutter/material.dart';

import 'package:swe2109567_assignment1/screens/home/home_page.dart';
import 'package:swe2109567_assignment1/screens/accommodation/accommodation_page.dart';
import 'package:swe2109567_assignment1/screens/attraction/attractions_page.dart';
import 'package:swe2109567_assignment1/widgets/navdrawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int myCurrentIndex = 0;
  List pages = const [
    HomePage(),
    AttractionPage(),
    AccommodationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Travo")
      ),
      drawer: const NavDrawer(),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 25,
                  offset: const Offset(8, 20)
              )
            ]
        ),
        child: ClipRRect(
          borderRadius:BorderRadius.circular(20),
          child: BottomNavigationBar(
              selectedItemColor: Colors.blueAccent,
              unselectedItemColor: Colors.black,
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.attractions), label: "Attraction"),
                BottomNavigationBarItem(icon: Icon(Icons.hotel), label: "Accommodation")
              ]
          ),
        ),
      ),

      body: pages[myCurrentIndex]
    );
  }

}