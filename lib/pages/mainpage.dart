import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fridge/colors/colors.dart';
import 'package:fridge/customClasses/textstyles.dart';
import 'package:fridge/customClasses/widgets.dart';
import 'package:circle_list/circle_list.dart';
import 'package:fridge/pages/logincodepage.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
              height: 64,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/INGLOGO.png',
                      scale: 16, 
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Moje ING',
                      style: TextStyle(
                          fontFamily: "Gudea", fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      height: 25,
                      width: 70,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.purple),
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          'Zaloguj',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.purple,
                              fontFamily: "Gudea"),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
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
                    children: const [
                      Text(
                        'Dzień dobry!',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 32, fontFamily: "Gudea"),
                      ),
                      Icon(
                        Icons.settings,
                        size: 30,
                      )
                    ],
                  ),
                  CircleList(
                    origin: const Offset(-120, 0),
                    innerRadius: 90,
                    outerRadius: 230,
                    initialAngle: 5.5,
                    centerWidget: ClipRRect(child: CircleMenu()),
                    rotateMode: RotateMode.stopRotate,
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

class CircleMenu extends StatefulWidget {
  const CircleMenu({super.key});

  @override
  State<CircleMenu> createState() => _CircleMenuState();
}

class _CircleMenuState extends State<CircleMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const LoginCodePage();
            },
          ),
        );
      },
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(100),
          color: orange,
        ),
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              minimum: 0,
              maximum: 100,
              radiusFactor: .9,
              showAxisLine: true,
              axisLineStyle: const AxisLineStyle(
                  dashArray: [2, 3],
                  color: Colors.white,
                  thicknessUnit: GaugeSizeUnit.factor,
                  thickness: 0.03),
              pointers: <GaugePointer>[
                RangePointer(
                    value: 45,
                    cornerStyle: CornerStyle.bothCurve,
                    enableAnimation: true,
                    animationDuration: 1200,
                    animationType: AnimationType.ease,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: Colors.white,
                    width: 0.03),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    angle: 0,
                    positionFactor: .5,
                    widget: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '45%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Gudea",
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  'KONTO Mobi',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Gudea",
                                      fontSize: 16),
                                ),
                                Text(
                                  '18-26',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Gudea",
                                      fontSize: 16),
                                )
                              ]),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
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
              Icon(
                icon,
                color: orange,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100, fontFamily: "Gudea"),
                  textAlign: TextAlign.center,
                ),
              )
            ]),
      ),
    );
  }
}
