import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:swe2109567_assignment1/models/attractions.dart';
import 'package:swe2109567_assignment1/screens/attraction/attraction_detail.dart';

class RAttractionPage extends StatefulWidget {
  const RAttractionPage({super.key});

  @override
  State<RAttractionPage> createState() => _RAttractionPageState();
}

class _RAttractionPageState extends State<RAttractionPage>{

  List<Attractions> attractions = [];

  void _getInitialInfo() {
    attractions = Attractions.getRecommendationAttractions();
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
            _attractionSection()
          ],
        )
    );
  }

  Column _attractionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
                'Attractions in Malaysia',
                style: TextStyle(
                    color: Colors.black,
                    fontSize:18,
                    fontWeight: FontWeight.w600
                )
            )
        ),

        const SizedBox(height: 15),

        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: attractions.length,
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
                      attractions[index].imagePath,
                      height: 80,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            attractions[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                            )
                        ),

                        const SizedBox(height: 5),

                        Text(
                            '${attractions[index].category} | ${attractions[index].distance}km',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),

                        const SizedBox(height: 5),

                        Text(
                            attractions[index].comment,
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
                                  => AttractionDetail(attrac: attractions[index])
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