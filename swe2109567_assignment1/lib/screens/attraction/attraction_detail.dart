import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/attractions.dart';

class AttractionDetail extends StatefulWidget {
  const AttractionDetail({super.key, required this.attrac});
  final Attractions attrac;

  @override
  State<AttractionDetail> createState() => _AttractionDetailState();
}

class _AttractionDetailState extends State<AttractionDetail>{

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
                      image: AssetImage(widget.attrac.imagePath),
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
                                  widget.attrac.name,
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                )
                              ),
                            ]
                          ),

                          const SizedBox(height: 15),

                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Color(0xFF5d69b3)),
                              const SizedBox(width: 5),
                              Text(
                                  widget.attrac.address,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF989acd)
                                )
                              )
                            ]
                          ),

                          const SizedBox(height: 20),

                          Text(
                              'Category: ' + widget.attrac.category,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF878593),
                                  fontWeight: FontWeight.w600
                              )
                          ),

                          const SizedBox(height: 20),

                          Row(
                            children: [
                              Text(
                                  widget.attrac.comment,
                                style: const TextStyle(
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
                              widget.attrac.description,
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
                            color: const Color(0xFF878593),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: IconButton(
                        onPressed: () => setState(
                                () => widget.attrac.like = !widget.attrac.like),
                        icon: widget.attrac.like
                            ? const Icon(Icons.favorite, color: Colors.pink)
                            : const Icon(Icons.favorite_border, color: Color(0xFF878593)),
                      ),
                    )
                  ]
                )
              )
            ]
          )
        )
      );
  }
}