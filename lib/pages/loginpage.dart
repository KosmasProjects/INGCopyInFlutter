import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fridge/customClasses/textstyles.dart';
import 'package:fridge/customClasses/widgets.dart';
import 'package:circle_list/circle_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Material(
            elevation: 2,
            child: Container(
              width: double.infinity,
              height: 72,
              child: Image(image: AssetImage('assets/images/ING_logo.jpg')),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Dzień dobry!',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 32, fontFamily: "PTS"),
                      ),
                      Icon(
                        Icons.settings,
                        size: 30,
                      )
                    ],
                  ),
                  SizedBox(height: 100),
                  CircleList(
                    origin: const Offset(-100, 0),
                    innerRadius: 100,
                    initialAngle: 5,
                    centerWidget: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.orange),
                      ),
                    ),
                    rotateMode: RotateMode.allRotate,
                    children: List.generate(8, (index) {
                      if (index == 0) {
                        return SmallCircle(
                            title: 'Kontakt i mapy',
                            icon: Icons.phone,
                            ontap: () {});
                      }
                      if (index == 1) {
                        return SmallCircle(
                            title: "Dodaj",
                            icon: Icons.card_giftcard,
                            ontap: () {});
                      }
                      if (index == 2) {
                        return SmallCircle(
                          title: "Zapłać",
                          icon: Icons.payment,
                          ontap: () {},
                        );
                      }
                      if (index == 3) {
                        return SmallCircle(
                            title: 'Szybki przelew',
                            icon: Icons.arrow_back_sharp,
                            ontap: () {});
                      }
                      if (index == 4) {
                        return SmallCircle(
                            title: 'Blik',
                            icon: Icons.card_travel,
                            ontap: () {});
                      } else {
                        return Container();
                      }
                      // return index <= 4 ? CircleMenu() : Container();
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class CircleMenu extends StatelessWidget {
  const CircleMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
    );
  }
}

class SmallCircle extends StatelessWidget {
  const SmallCircle(
      {super.key,
      required this.title,
      required this.icon,
      required this.ontap});
  final String title;
  final IconData icon;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w100),
                  textAlign: TextAlign.center,
                ),
              )
            ]),
      ),
    );
  }
}
