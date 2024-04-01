import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phan4_bai1/components/doikhan.dart';

class Tiencuoc extends StatefulWidget {
  const Tiencuoc({super.key});

  @override
  State<Tiencuoc> createState() => _TiencuocState();
}

class _TiencuocState extends State<Tiencuoc> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool val1 = false;
  final _topicController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 206, 216, 255),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(left: 0),
              child: Container(
                padding: EdgeInsets.only(top: 40),
                width: 380,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xff355BCA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('Choose the skill ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Vocabulary',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          value: this.valuesecond,
                          onChanged: (bool? value) {
                            setState(() {
                              this.valuesecond = value!;
                            });
                          },
                        ),
                        Text(
                          'Grammar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          value: this.valuefirst,
                          onChanged: (bool? value) {
                            setState(() {
                              this.valuefirst = value!;
                            });
                          },
                        ),
                        // Text(
                        //   'Xã Hội ',
                        //   style: TextStyle(
                        //       fontSize: 17.0, fontWeight: FontWeight.bold),
                        // ),
                        // Checkbox(
                        //   value: this.val1,
                        //   onChanged: (bool? value) {
                        //     setState(() {
                        //       this.val1 = value!;
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                    Text('Enter your money ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _topicController,
                        decoration: const InputDecoration(labelText: "Money"),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: ElevatedButton(
                          child: const Text(
                            'Start',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => doikhan()));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
