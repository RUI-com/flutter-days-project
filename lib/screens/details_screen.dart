// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
// import 'package:flutter_application_1/widgets/bottom_nav_bar.dart';
import 'package:flutter_application_1/widgets/search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        // bottomNavigationBar: BottomNavBar(),
        body: Stack(
      children: [
        Container(
          height: size.height * .50,
          decoration: BoxDecoration(
            color: kBlueLightColor,
            image: DecorationImage(
              image: AssetImage("assets/img/meditation_bg.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        "Meditation",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "3-10 MIN Course",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width:
                            size.width * .6, // it just take 60% of total width
                        child: Text(
                          "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                        ),
                      ),
                      SizedBox(
                        width: size.width * .5, // it just take the 50% width
                        child: Searchbar(),
                      ),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          SeassionCard(
                            seassionNum: 1,
                            isDone: true,
                            press: () {},
                          ),
                          SeassionCard(
                            seassionNum: 2,
                            isDone: false,
                            press: () {},
                          ),
                          SeassionCard(
                            seassionNum: 3,
                            isDone: false,
                            press: () {},
                          ),
                          SeassionCard(
                            seassionNum: 4,
                            isDone: false,
                            press: () {},
                          ),
                          SeassionCard(
                            seassionNum: 5,
                            isDone: false,
                            press: () {},
                          ),
                          SeassionCard(
                            seassionNum: 6,
                            isDone: false,
                            press: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Meditation",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.all(10),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/Meditation_women_small.svg",
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Basic 2",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text("Start your deepen you practice")
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SvgPicture.asset("assets/icons/Lock.svg"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))),
      ],
    ));
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    super.key,
    required this.seassionNum,
    required this.isDone,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: Colors.white,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $seassionNum",
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
