import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fridge/colors/colors.dart';

class LoginCodePage extends StatefulWidget {
  const LoginCodePage({super.key});

  @override
  State<LoginCodePage> createState() => _LoginCodePageState();
}

class _LoginCodePageState extends State<LoginCodePage> {
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  TextEditingController number3 = TextEditingController();
  TextEditingController number4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 2,
            child: SizedBox(
              width: double.infinity,
              height: 64,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: orange,
                        )),
                    Image.asset(
                      'assets/images/INGLOGO.png',
                      scale: 16,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Moje ING',
                      style: TextStyle(
                          fontFamily: "Gudea", fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Logowanie',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Gudea",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      'Podaj PIN dla loginu ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Gudea",
                      ),
                    ),
                    const Text(
                      'KOSCIE****:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Gudea",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: [
                NumberInput(controller: number1),
                SizedBox(width: 5),
                NumberInput(controller: number2),
                SizedBox(width: 5),
                NumberInput(controller: number3),
                SizedBox(width: 5),
                NumberInput(controller: number4),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class NumberInput extends StatelessWidget {
  NumberInput({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 52,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffE9E9E9), borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(border: InputBorder.none),
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 20, color: Colors.black),
          onChanged: ((value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          }),
        ),
      ),
    );
  }
}
