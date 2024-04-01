import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phan4_bai1/chudechoi/chooseskill.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramhome.dart';
import 'package:phan4_bai1/components/battle_screen.dart';

import 'package:phan4_bai1/components/doikhan.dart';

class Choose_Mode extends StatefulWidget {
  const Choose_Mode({super.key});

  @override
  State<Choose_Mode> createState() => _Choose_ModeState();
}

class _Choose_ModeState extends State<Choose_Mode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 60),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bai.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100.0),
                  Image.asset('assets/logo1.png', width: 300, height: 100),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      color: const Color(0xff355BCA).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        /*Text(
                          "Chọn chế độ chơi:",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                          ),
                        ),*/
                        Container(
                            padding: const EdgeInsets.fromLTRB(50, 55, 50, 15),
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Single player',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const chonchude()));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xff355BCA))),
                            )),
                        Container(
                            padding: const EdgeInsets.fromLTRB(50, 25, 50, 50),
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Multiplayer',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Battle_Sceen()));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xff355BCA))),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
