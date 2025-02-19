import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:swe2109567_assignment1/models/accommodation.dart';
import 'package:swe2109567_assignment1/screens/accommodation/sr_accommodation_page.dart';

import 'accommodation_detail.dart';

class SDAccommodationPage extends StatefulWidget {
  const SDAccommodationPage({super.key});

  @override
  State<SDAccommodationPage> createState() => _SDAccommodationPageState();
}

class _SDAccommodationPageState extends State<SDAccommodationPage>{

  List<Accommodation> accommodation = [];
  List<String> dropDown = <String>["Distance", "Rating"];

  get recAccommodation => null;

  void _getInitialInfo() {
    accommodation = Accommodation.getAccommodationsByDistance();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Travo")
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
            padding: EdgeInsets.only(left: 20.0, right: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Accommodation in Malaysia',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  ),

                  DropdownButton<String>(
                    underline: Container(),
                    icon: SvgPicture.asset(
                        'assets/icons/sort.svg',
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
                      if (value == "Distance") {
                        setState(() {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)
                                  => const SDAccommodationPage()
                              )
                          );
                        });
                      }
                      else if (value == "Rating") {
                        setState(() {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)
                                  => const SRAccommodationPage()
                              )
                          );
                        });
                      }
                    },
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