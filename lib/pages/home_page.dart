import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/components/custom_outline.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/pages/movies_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // باخد طول الشاشه وعرضها عشان الرسبونسف
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SizedBox(
        width: screenWidth,
        height: screenHight,
        child: Stack(children: [
          Positioned(
            top: screenHight * 0.4,
            right: -88,
            child: Container(
              height: 166,
              width: 166,
              decoration: BoxDecoration(
                color: Constants.kGreenColor.withOpacity(0.5),
                shape: BoxShape.circle,
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
            top: -100,
            left: -100,
            child: Container(
              height: 200,
              width: 200,
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
                  height: 200,
                  width: 200,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          SafeArea(
            child: SizedBox(
              width: screenWidth,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHight * 0.07,
                  ),
                  CustomOutline(
                    strokeWidth: 4,
                    radius: screenWidth * 0.8,
                    gradient: const LinearGradient(
                        colors: [
                          Constants.kPinkColor,
                          Color.fromARGB(16, 254, 83, 186),
                          Constants.kGreenColor,
                          Color.fromARGB(14, 9, 251, 211)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          .2,
                          .4,
                          .6,
                          1,
                        ]),
                    width: screenWidth * 0.8,
                    height: screenWidth * 0.8,
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/img-onboarding.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHight * .05,
                  ),
                  const Text(
                    'Watch movies in\nVirtual Reality?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: screenHight * .03,
                  ),
                  Text(
                    'Download and watch offline\n wherever you are ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Constants.kWhiteColor.withOpacity(0.75),
                    ),
                  ),
                  SizedBox(
                    height: screenHight * .04,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MoviesPage();
                      }));
                    },
                    child: CustomOutline(
                      strokeWidth: 4,
                      radius: screenWidth * .5,
                      gradient: const LinearGradient(
                          colors: [
                            Constants.kPinkColor,
                            Color.fromARGB(16, 254, 83, 186),
                            Constants.kGreenColor,
                            Color.fromARGB(14, 9, 251, 211)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [
                            .2,
                            .4,
                            .6,
                            1,
                          ]),
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenHight <= 660 ? 11 : 15,
                          fontWeight: FontWeight.w700,
                          color: Constants.kWhiteColor,
                        ),
                      ),
                      width: screenWidth * .5,
                      height: 47,
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 0
                                ? Constants.kGreenColor
                                : index == 1
                                    ? Constants.kWhiteColor.withOpacity(0.2)
                                    : Constants.kWhiteColor.withOpacity(0.2)),
                      );
                    }),
                  ),
                  SizedBox(
                    height: screenHight * .04,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
