import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:swe2109567_assignment1/models/accommodation.dart';
import 'package:swe2109567_assignment1/screens/accommodation/sd_accommodation_page.dart';
import 'package:swe2109567_assignment1/screens/accommodation/sr_accommodation_page.dart';
import 'package:swe2109567_assignment1/screens/accommodation/accommodation_detail.dart';

import 'package:swe2109567_assignment1/widgets/likes_attraction.dart';

class LikesAccommodationPage extends StatefulWidget {
  const LikesAccommodationPage({super.key});

  @override
  State<LikesAccommodationPage> createState() => _LikesAccommodationPageState();
}

class _LikesAccommodationPageState extends State<LikesAccommodationPage>{

  List<Accommodation> accommodation = [];
  List<String> dropDown = <String>["Accommodation", "Attraction"];

  get recAccommodation => null;

  void _getInitialInfo() {
    accommodation = Accommodation.getLikedAccommodations();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Likes")
        ),
        body: ListView(
          children: [
            const SizedBox(height: 15),
            _accommodationSection()
          ],
        )
    );
  }

  Column _accommodationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Accommodation List',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  ),

                  DropdownButton<String>(
                      underline: Container(),
                      icon: SvgPicture.asset(
                          'assets/icons/Filter.svg',
                          width: 25,
                          height: 25
                      ),
                      items: dropDown.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),

                      onChanged: (String? value) {
                        if (value == "Accommodation") {
                          setState(() {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context)
                                    => const LikesAccommodationPage()
                                )
                            );
                          });
                        }
                        else if (value == "Attraction") {
                          setState(() {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context)
                                    => const LikesAttractionPage()
                                )
                            );
                          });
                        }
                      }
                  )
                ]
            )
        ),

        const SizedBox(height: 20),

        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: accommodation.length,
          shrinkWrap: true,
          separatorBuilder: (context, index)=> const SizedBox(height: 15),
          padding: const EdgeInsets.only(
              left: 20,
              right: 20
          ),
          itemBuilder: (context, index) {
            return Container(
                width: 100,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.15),
                          offset: const Offset(0,5),
                          blurRadius: 40
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      accommodation[index].imagePath,
                      height: 80,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            accommodation[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                            )
                        ),

                        const SizedBox(height: 5),

                        Text(
                            'RM${accommodation[index].price} | ${accommodation[index].category} | ${accommodation[index].distance}km',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),

                        const SizedBox(height: 5),

                        RatingBar.builder(
                          initialRating: accommodation[index].rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 20,
                          itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color(0xFFe7bb4e)
                          ),
                          onRatingUpdate: (double value) {  },
                        )
                      ],
                    ),
                    GestureDetector(
                        child: SvgPicture.asset(
                          'assets/icons/button.svg',
                          width: 25,
                          height: 25,
                        ),

                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)
                                  => AccommodationDetail(accom: accommodation[index])
                              )
                          );
                        }

                    )
                  ],
                )
            );
          },
        )
      ],
    );
  }
}