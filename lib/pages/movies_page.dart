import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:movie_app/components/masked_image.dart';

import 'package:movie_app/constants.dart';
import 'package:movie_app/pages/move_Deitals.dart';

// ignore: must_be_immutable
class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<String> imgList = [
    'assets/movie-posters/img-aquaman.jpg',
    'assets/movie-posters/img-batman.jpg',
    'assets/movie-posters/img-eternals.jpg',
    'assets/movie-posters/img-matrix.jpg',
    'assets/movie-posters/img-sonic.jpg',
    'assets/movie-posters/img-spiderman.jpg',
  ];

  List<String> imgList2 = [
    'assets/movie-posters/img-eternals.jpg',
    'assets/movie-posters/img-sonic.jpg',
    'assets/movie-posters/img-spiderman.jpg',
    'assets/movie-posters/img-aquaman.jpg',
    'assets/movie-posters/img-matrix.jpg',
    'assets/movie-posters/img-batman.jpg',
  ];

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
                color: Constants.kGreenColor.withOpacity(0.5),
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
                color: Constants.kPinkColor.withOpacity(0.5),
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
          SafeArea(
            child: ListView(
              children: [
                const SizedBox(
                  height: 26,
                ),
                Text(
                  'What would you\nlike to watch?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Constants.kWhiteColor.withOpacity(.8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),

                // search
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      color: Constants.kGreyColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(
                          Constants.kIconSearch,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Constants.kWhiteColor.withOpacity(0.6),
                              fontSize: 17,
                              letterSpacing: -0.41,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              isDense: true,
                              hintStyle: TextStyle(
                                color: Constants.kWhiteColor.withOpacity(0.6),
                                fontSize: 17,
                                letterSpacing: -0.41,
                              ),
                            ),
                            onChanged: (value) {
                              if (value == '') {
                                imgList = [
                                  'assets/movie-posters/img-aquaman.jpg',
                                  'assets/movie-posters/img-batman.jpg',
                                  'assets/movie-posters/img-eternals.jpg',
                                  'assets/movie-posters/img-matrix.jpg',
                                  'assets/movie-posters/img-sonic.jpg',
                                  'assets/movie-posters/img-spiderman.jpg',
                                ];
                                ;
                              } else if (value == 'aquaman' ||
                                  value == 'batman' ||
                                  value == 'matrix' ||
                                  value == 'spiderman' ||
                                  value == 'sonic' ||
                                  value == 'eternals') {
                                imgList = [
                                  'assets/movie-posters/img-$value.jpg',
                                ];
                              } else {
                                imgList = ['assets/movie-posters/not.png'];
                              }

                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(Constants.kIconMic),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Popular movies',
                    style: TextStyle(
                      color: Constants.kWhiteColor.withOpacity(.8),
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 155,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: imgList.length,
                    itemBuilder: (context, index) {
                      String mask;
                      if (index == 0) {
                        mask = Constants.kMaskFirstIndex;
                      } else if (index == imgList.length - 1) {
                        mask = Constants.kMaskLastIndex;
                      } else {
                        mask = Constants.kMaskCenter;
                      }
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MoviesDeitals(
                                imgPath: imgList[index],
                                movieName: imgList[index]
                                    .substring(25, 31)
                                    .toUpperCase(),
                                movieContent:
                                    'Wish is an upcoming American animated musical fantasy film produced by Walt Disney Animation Studios and released by Walt Disney Pictures',
                                movieDate:
                                    '2021.Action-Adventure\nFantast.2h36m',
                              );
                            },
                          ));
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                            ),
                            width: 142,
                            height: 155,
                            child: MaskedImage(
                              asset: imgList[index],
                              mask: mask,
                            )),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Upcoming movies',
                    style: TextStyle(
                      color: Constants.kWhiteColor.withOpacity(.8),
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 155,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: imgList2.length,
                    itemBuilder: (context, index) {
                      String mask;
                      if (index == 0) {
                        mask = Constants.kMaskFirstIndex;
                      } else if (index == imgList2.length - 1) {
                        mask = Constants.kMaskLastIndex;
                      } else {
                        mask = Constants.kMaskCenter;
                      }
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MoviesDeitals(
                                imgPath: imgList2[index],
                                movieName: imgList2[index]
                                    .substring(25, 31)
                                    .toUpperCase(),
                                movieContent:
                                    'Wish is an upcoming American animated musical fantasy film produced by Walt Disney Animation Studios and released by Walt Disney Pictures',
                                movieDate:
                                    '2021.Action-Adventure\nFantast.2h36m',
                              );
                            },
                          ));
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                            ),
                            width: 142,
                            height: 155,
                            child: MaskedImage(
                              asset: imgList2[index],
                              mask: mask,
                            )),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: Container(
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
            child: SvgPicture.asset(Constants.kIconPlus),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        width: screenWidth,
        height: 92,
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kWhiteColor.withOpacity(.1),
            Constants.kWhiteColor.withOpacity(0.1),
          ],
        ),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kPinkColor,
            Constants.kGreenColor,
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          notchMargin: 4,
          elevation: 0,
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconHome,
                      color: const Color.fromARGB(224, 227, 227, 227),
                    )),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Constants.kIconPlayOnTv,
                    color: const Color.fromARGB(224, 227, 227, 227),
                  ),
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    color: const Color.fromARGB(224, 227, 227, 227),
                    Constants.kIconCategories,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    color: const Color.fromARGB(224, 227, 227, 227),
                    Constants.kIconDownload,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
