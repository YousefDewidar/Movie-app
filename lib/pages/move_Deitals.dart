// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';


import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constants.dart';

class MoviesDeitals extends StatelessWidget {
  const MoviesDeitals({super.key, required this.imgPath, required this.movieName, required this.movieContent, required this.movieDate});
  final String imgPath;
  final String movieName;
  final String movieContent; 
  final String movieDate; 
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SizedBox(
        width: screenWidth,
        height: screenHight,
        child: Stack(children: [
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.kYellowColor.withOpacity(0.5),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 200,
                  sigmaY: 200,
                ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHight * 0.4,
            right: -88,
            child: Container(
              height: 166,
              width: 166,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.kPinkColor.withOpacity(1),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 200,
                  sigmaY: 200,
                ),
                child: Container(
                  height: 166,
                  width: 166,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.kCyanColor.withOpacity(0.5),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 200,
                  sigmaY: 200,
                ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          // add img
          Container(
              width: screenWidth,
              height: screenHight / 2,
              decoration:BoxDecoration(
                image: DecorationImage(image:AssetImage(imgPath),fit: BoxFit.cover),
              ),

          ),
          SafeArea(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Constants.kWhiteColor, width: 3),
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            color: Colors.white,
                            Icons.arrow_back,
                            size: 27,
                          ))),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Constants.kWhiteColor, width: 3),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            color: Colors.white,
                            Icons.menu,
                            size: 27,
                          ))),
                ]),
          ),
          // Icon play
          Positioned(
            top: screenHight / 2 - 70,
            right: 10,
            child: Container(
              width: 66,
              height: 66,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Constants.kPinkColor.withOpacity(0.2),
                    Constants.kGreenColor.withOpacity(0.2)
                  ],
                ),
              ),
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Constants.kPinkColor, Constants.kGreenColor],
                  ),
                ),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  fillColor: const Color(0xff404c57),
                  child: SvgPicture.asset(Constants.kIconPlay),
                ),
              ),
            ),
          ),
          // words after img
          Positioned(
            width: screenWidth,
            top: screenHight / 2 - 40,
            child: Column(
              children: [
                Text(
                  movieName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  textAlign: TextAlign.center,
                  movieDate,
                  style: TextStyle(
                    color: Color.fromARGB(233, 145, 144, 144),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RatingWidget(),
                SizedBox(
                  height: 15,
                ),
                // content about movie
                SizedBox(
                  width: screenWidth - 80,
                  height: 110,
                  child:  Text(
                    overflow: TextOverflow.fade,
                    maxLines: 4,
                    textAlign: TextAlign.center,
                    movieContent,
                    style: TextStyle(
                      color: Color.fromARGB(233, 145, 144, 144),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Divider(
                  endIndent: 30,
                  indent: 30,
                  color: Color.fromARGB(131, 118, 118, 118),
                  thickness: 2,
                ),

                // Casts
                SizedBox(
                  width: screenWidth - 35,
                  child: const Text(
                    textAlign: TextAlign.start,
                    'Casts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnglelinaCard(),
                        SizedBox(
                          width: 20,
                        ),
                        AnglelinaCard(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnglelinaCard(),
                        SizedBox(
                          width: 20,
                        ),
                        AnglelinaCard(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class AnglelinaCard extends StatelessWidget {
  const AnglelinaCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 75, 75, 77),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Text(
          'Angelimna jolie',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color.fromARGB(255, 182, 221, 220)),
        ));
  }
}

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 22,
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
