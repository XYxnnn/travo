import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:swe2109567_assignment1/models/category.dart';
import 'package:swe2109567_assignment1/models/accommodation.dart';
import 'package:swe2109567_assignment1/models/attractions.dart';
import 'package:swe2109567_assignment1/screens/accommodation/accommodation_detail.dart';
import 'package:swe2109567_assignment1/screens/home/r_accommodation_page.dart';
import 'package:swe2109567_assignment1/screens/attraction/attraction_detail.dart';
import 'package:swe2109567_assignment1/screens/home/r_attraction_page.dart';
import 'package:swe2109567_assignment1/screens/home/exploration.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories = [];
  List<Attractions> recAttractions = [];
  List<Accommodation> recAccommodation = [];

  List<Attractions> resultAttractions = [];
  List<Accommodation> resultAccommodation = [];

  final String videoId = 'vbm90ThCNDQ';
  late YoutubePlayerController _controller;

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    recAttractions = Attractions.getTopAttractions();
    recAccommodation = Accommodation.getTopAccommodation();
  }

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
            mute: false,
            autoPlay: true,
            disableDragSeek: true,
            loop: false,
            enableCaption: false
        )
    );
    _getInitialInfo();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            _searchField(),
            const SizedBox(height: 5),
            _videoSection(),
            const SizedBox(height: 50),
            _explorationSection(),
            const SizedBox(height: 50),
            _recAttractionSection(),
            const SizedBox(height: 50),
            _recAccommodationSection()
          ],
        )
    );
  }

  Container _searchField() {
    return Container(
        margin: const EdgeInsets.only(top:40, left:20, right:20),

        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12.withOpacity(0.10),
                  blurRadius: 30
              )
            ]
        ),

        child: Column(
          children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/icons/Search.svg'),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/icons/Filter.svg'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
          ]
        )
    );
  }

  Container _videoSection() {
    return Container(
        margin: const EdgeInsets.only(top:40, left:20, right:20),
        child: YoutubePlayer(controller: _controller)
    );
  }

  Column _explorationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
              'Exploration',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              )
          ),
        ),

        const SizedBox(height: 15),

        Container(
            height: 120,
            child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
              ),
              separatorBuilder: (context, index)=> const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xff9DCFFF).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SvgPicture.asset(categories[index].iconPath),
                                  )
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context)
                                        => Exploration(cate: categories[index].name)
                                    )
                                );
                              }
                          ),
                          Text(
                              categories[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 14
                              )
                          ),

                        ]
                    )
                );
              },
            )
        )
      ],
    );
  }

  Column _recAttractionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20.0, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recommendation for\nAttraction',
                   style: TextStyle(
                      color: Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.w600
                   ),
                ),
                InkWell(
                  child: const Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 17,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context)
                            => const RAttractionPage()
                        )
                    );
                  },
                ),
              ]
            )
        ),

        const SizedBox(height: 15),

        ListView.separated(
          itemCount: recAttractions.length,
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
                        recAttractions[index].imagePath,
                        height: 80,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            recAttractions[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                            )
                        ),

                        const SizedBox(height: 5),

                        Text(
                            '${recAttractions[index].category} | ${recAttractions[index].distance}km',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),

                        const SizedBox(height: 5),

                        Text(
                            recAttractions[index].comment,
                            style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            )
                        ),
                      ],
                    ),
                    GestureDetector(
                        child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 25,
                            height: 25
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)
                                  => AttractionDetail(attrac: recAttractions[index])
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

  Column _recAccommodationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20.0, right: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recommendation for\nAccommodation',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize:18,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  InkWell(
                    child: const Text(
                      'View All',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 17,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context)
                              => RAccommodationPage()
                          )
                      );
                    },
                  ),
                ]
            )
        ),

        const SizedBox(height: 15),

        ListView.separated(
          itemCount: recAccommodation.length,
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
                        recAccommodation[index].imagePath,
                        height: 80,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            recAccommodation[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                            )
                        ),

                        const SizedBox(height: 5),

                        Text(
                            '${recAccommodation[index].category} | RM${recAccommodation[index].price} | ${recAccommodation[index].distance}km',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),

                        const SizedBox(height: 5),

                        RatingBar.builder(
                          initialRating: recAccommodation[index].rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 20,
                          itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color(0xFFe7bb4e)
                          ),
                          onRatingUpdate: (double value) {  },
                        ),
                      ],
                    ),
                    GestureDetector(
                        child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 25,
                            height: 25
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)
                                  => AccommodationDetail(accom: recAccommodation[index])
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