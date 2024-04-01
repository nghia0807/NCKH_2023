import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:phan4_bai1/chudechoi/sexoa/choidonhacknao.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramhome.dart';
import 'package:phan4_bai1/chudechoi/vocabulary/vocabhome.dart';

import 'package:phan4_bai1/models/action_button.dart';

class chonchude extends StatefulWidget {
  const chonchude({super.key});

  @override
  State<chonchude> createState() => _chonchudeState();
}

class _chonchudeState extends State<chonchude> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bai.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                height: 200,
              ),
              Text('Single player',
                  style: TextStyle(
                      color: const Color(0xff355BCA),
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0)),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Căn chỉnh về phía trái
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 50, // Độ rộng của nền
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => choidon()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF355BCA)), // Đây là màu 355BCA
                      ),
                      child: Center(
                        child: Text('Grammar'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 50, // Độ rộng của nền
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => choidonxahoi()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF355BCA)), // Đây là màu 355BCA
                      ),
                      child: Center(
                        child: Text('Vocabulary'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
