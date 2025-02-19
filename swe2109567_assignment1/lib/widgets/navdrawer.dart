import 'package:flutter/material.dart';
import 'package:swe2109567_assignment1/widgets/profile_page.dart';

import '../screens/home/home_page.dart';
import '../screens/mainpage.dart';

import 'notes.dart';
import 'package:swe2109567_assignment1/widgets/likes_attraction.dart';
import 'package:swe2109567_assignment1/widgets/likes_accommodation.dart';


class NavDrawer extends StatelessWidget{
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children: [
              const SizedBox(height: 10),
              UserAccountsDrawerHeader(
                  accountName: const Text(
                      "Lord Voldemort",
                      style: TextStyle(
                          fontSize: 18,
                      ),
                  ),
                  accountEmail: const Text(
                      "lord_voldemort@gmail.com",
                      style: TextStyle(fontSize: 16)
                  ),
                  currentAccountPicture: ClipOval(
                      child: Image.asset(
                          'assets/images/voldemort.png',
                          fit: BoxFit.cover
                      )
                  ),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background3.png'),
                          fit: BoxFit.cover
                      )
                  ),
              ),

              ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context) => const MainPage()));
                  },
                  title: const Text(
                    "Home",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                      Icons.home
                  )
              ),
              ListTile(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()));
                  },
                  title: const Text(
                      "Profile",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                  ),
                  leading: const Icon(
                      Icons.person
                  )
              ),
              ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LikesAccommodationPage()));
                  },
                  title: const Text(
                      "Likes",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                  ),
                  leading: const Icon(
                      Icons.favorite
                  )
              ),
              ListTile(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Notes()));
                  },
                  title: const Text(
                      "Notes",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                  ),
                  leading: const Icon(
                      Icons.book
                  )
              ),
              ListTile(
                  onTap: () {
                    Navigator.pop(context);

                    //Navigator.push(context,
                        //MaterialPageRoute(builder: (context) => const ContactPage()));
                  },
                  title: const Text(
                      "Setting",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                  ),
                  leading: const Icon(
                      Icons.settings
                  )
              )
            ]
        )
    );
  }
}