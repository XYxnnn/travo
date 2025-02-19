import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/accommodation.dart';
import '../../widgets/navdrawer.dart';

class AccommodationDetail extends StatefulWidget {
  const AccommodationDetail({super.key, required this.accom});
  final Accommodation accom;

  @override
  State<AccommodationDetail> createState() => _AccommodationDetailState();
}

class _AccommodationDetailState extends State<AccommodationDetail>{

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Travo")
        ),
        // drawer: const NavDrawer(),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.accom.imagePath),
                      fit:BoxFit.cover
                    )
                  )
                )
              ),

              Positioned(
                  top: 300,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 550,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.accom.name,
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                )
                              ),
                            ]
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Color(0xFF5d69b3)),
                              const SizedBox(width: 5),
                              Text(
                                  widget.accom.address,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF989acd)
                                )
                              )
                            ]
                          ),

                          const SizedBox(height: 20),

                          Text(
                              'RM${widget.accom.price}',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 23,
                                  color: Color(0xFF5d69b3)
                              )
                          ),

                          const SizedBox(height: 20),

                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: widget.accom.rating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemSize: 20,
                                itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Color(0xFFe7bb4e)
                                ),
                                onRatingUpdate: (double value) {  },
                              ),
                              Text(
                                ' (' + widget.accom.rating.toString() + ')',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF878593)
                                )
                              )
                            ]
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            )
                          ),
                          const SizedBox(height: 10),
                          Text(
                              widget.accom.description,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF878593)
                              )
                          ),
                        ]
                      )
                  )
              ),

              Positioned(
                top: 320,
                right: 20,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xFF878593),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15)
                      ),

                      child: IconButton(
                        onPressed: () => setState(
                                () => widget.accom.like = !widget.accom.like),
                        icon: widget.accom.like
                            ? const Icon(Icons.favorite, color: Colors.pink)
                            : const Icon(Icons.favorite_border, color: Color(0xFF878593)),
                      ),
                    ),
                  ]
                )
              )
            ]
          )
        )
      );
  }
}