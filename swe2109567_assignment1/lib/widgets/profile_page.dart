import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white30,
          centerTitle: true,
          title: const Text('Profile'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/background.png',
                ),
                const Positioned(
                  bottom: -40,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/voldemort.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Column(
                children: [
                  Text(
                    "Lord Voldemort",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Traveller",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "About",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Text(
                "I am Lord Voldemort, the most powerful dark wizard the world has ever known. \n\n"
                    "Despite my dominion over the wizarding world, even I must occasionally indulge in the mundane. "
                    "I have decided to embark on a journey, seeking destinations that resonate with my dark and enigmatic nature. "
                    "Perhaps I shall explore the ancient, mysterious ruins of the world, or the deep, impenetrable forests where secrets lie hidden. ",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF878593)
                ),
              ),
            )
          ],
        ));
  }
}