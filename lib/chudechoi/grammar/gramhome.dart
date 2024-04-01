import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr1.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr2.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr3.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr4.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr5.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr6.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr7.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr8.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr9.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr10.dart';

import 'package:phan4_bai1/components/menu.dart';

import 'package:phan4_bai1/components/shopeee.dart';
import 'package:phan4_bai1/models/question.dart';
import 'package:phan4_bai1/models/rank_auth_button.dart';

class choidon extends StatefulWidget {
  const choidon({super.key});

  @override
  State<choidon> createState() => _choidonState();
}

class _choidonState extends State<choidon> {
  String name = '';
  String email = '';
  int mony = 0;
  String? image = '';
  Future _getdata() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["name"];
          email = snapshot.data()!["email"];
          mony = snapshot.data()!["mony"];
          image = snapshot.data()!["photoUrl"];
        });
      }
    });
  }

  int den = 0;
  int tim = 0;
  Future _getshop() async {
    await FirebaseFirestore.instance
        .collection('shop')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          // name = snapshot.data()!["name"];
          den = snapshot.data()!["den"];
          tim = snapshot.data()!["tim"];
        });
      }
    });
  }

  Future _getdatadeim() async {
    await FirebaseFirestore.instance
        .collection('toan')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          man1 = snapshot.data()!["man1"];
          man2 = snapshot.data()!["man2"];
          man3 = snapshot.data()!["man3"];
          man4 = snapshot.data()!["man4"];
          man5 = snapshot.data()!["man5"];
          man6 = snapshot.data()!["man6"];
          man7 = snapshot.data()!["man7"];
          man8 = snapshot.data()!["man8"];
          man9 = snapshot.data()!["man9"];
          man10 = snapshot.data()!["man10"];
        });
      }
    });
  }

  int man1 = 0;
  int man2 = 0;
  int man3 = 0;
  int man4 = 0;
  int man5 = 0;
  int man6 = 0;
  int man7 = 0;
  int man8 = 0;
  int man9 = 0;
  int man10 = 0;
  Future _updatediem() async {
    await FirebaseFirestore.instance
        .collection('toan')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          man1 = snapshot.data()!["man1"];
          man2 = snapshot.data()!["man2"];
          man3 = snapshot.data()!["man3"];
          man4 = snapshot.data()!["man4"];
          man5 = snapshot.data()!["man5"];
          man6 = snapshot.data()!["man6"];
          man7 = snapshot.data()!["man7"];
          man8 = snapshot.data()!["man8"];
          man9 = snapshot.data()!["man9"];
          man10 = snapshot.data()!["man10"];
        });
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'diemtoan':
            man1 + man2 + man3 + man4 + man5 + man6 + man7 + man8 + man9 + man10
      });
    });
  }

  int diem1 = 0;
  int diem2 = 0;
  int diem3 = 0;
  Future _updatediemtong() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          diem1 = snapshot.data()!["diemhacknao"];
          diem2 = snapshot.data()!["diemtoan"];
          diem3 = snapshot.data()!["diemvatly"];
        });
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'diemtong': diem1 + diem2 + diem3});
    });
  }

  @override
  void initState() {
    super.initState();

    _getdata();
    _getshop();
    _getdatadeim();
    _updatediem();
    _updatediemtong();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 216, 255),
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 9,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color(0xff355BCA),
            border: Border.all(width: 2.3, color: Colors.white),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0)),
          ),
          child: Row(
            children: [
              IconButton(
                padding: EdgeInsets.only(top: 25),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Container(
                  height: MediaQuery.of(context).size.height / 12 / 2,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 0),
                        child: Image(
                          image: AssetImage('assets/tien.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, top: 5),
                        child: Text(mony.toString()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const shoppee()));
                          },
                          icon: Icon(Icons.shopping_cart),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, top: 25),
                child: Container(
                  height: MediaQuery.of(context).size.height / 12 / 2,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 0),
                        child: Image(
                          image: AssetImage('assets/den.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, top: 5),
                        child: Text(den.toString()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ////////////////////////////////////////////////////////////////////////////////
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text('Grammar',
              style: TextStyle(
                  color: const Color(0xff355BCA),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0)),
        ),

        Container(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Row(children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('questions5')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final questiondocs = snapshot.data!.docs;
                  final questions = questiondocs
                      .map((e) => Question.fromQueryDocumentSnapshot(e))
                      .toList();

                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('config')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final configDocs = snapshot.data!.docs.first.data()
                          as Map<String, dynamic>;
                      final totalTime = configDocs['key'];

                      return Row(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => cauhoi(
                                                totalTimer: totalTime,
                                                questions: questions,
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0, top: 0),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    width:
                                        MediaQuery.of(context).size.width / 3.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0)),
                                      border: Border.all(
                                          width: 2.3,
                                          color:
                                              Color.fromARGB(255, 43, 42, 42)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Đặt căn chữ vào giữa theo chiều dọc
                                      children: [
                                        Text('Round 1',
                                            style: TextStyle(
                                                color: const Color(0xff355BCA),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23.0)),
                                        Text('Score: ' + man1.toString() + '/5',
                                            style: TextStyle(
                                                color: const Color(0xff355BCA),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.5)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //  Text('số câu hỏi : ${questions.length - 11}'),
                              //man1
                              InkWell(
                                onTap: () {
                                  if (man2 >= 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => cauhoi2(
                                                  totalTimer: totalTime,
                                                  questions: questions,
                                                )));
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0, top: 0),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    width:
                                        MediaQuery.of(context).size.width / 3.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0)),
                                      border: Border.all(
                                          width: 2.3,
                                          color:
                                              Color.fromARGB(255, 43, 42, 42)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Đặt căn chữ vào giữa theo chiều dọc
                                      children: [
                                        Text('Round 3',
                                            style: TextStyle(
                                                color: const Color(0xff355BCA),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23.0)),
                                        Text('Score: ' + man3.toString() + '/5',
                                            style: TextStyle(
                                                color: const Color(0xff355BCA),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.5)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //man  3
                              //  Text('số câu hỏi : ${questions.length - 11}'),

                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => cauhoi4(
                                                totalTimer: totalTime,
                                                questions: questions,
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0, top: 0),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    width:
                                        MediaQuery.of(context).size.width / 3.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0)),
                                      border: Border.all(
                                          width: 2.3,
                                          color:
                                              Color.fromARGB(255, 43, 42, 42)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Đặt căn chữ vào giữa theo chiều dọc
                                      children: [
                                        Text('Round 5',
                                            style: TextStyle(
                                                color: const Color(0xff355BCA),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23.0)),
                                        Text('Score: ' + man5.toString() + '/5',
                                            style: TextStyle(
                                                color: const Color(0xff355BCA),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.5)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //  Text('số câu hỏi : ${questions.length - 11}'),
                              //man 5
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => cauhoi6(
                                                totalTimer: totalTime,
                                                questions: questions,
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0, top: 0),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    width:
                                        MediaQuery.of(context).size.width / 3.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0)),
                                      border: Border.all(
                                          width: 2.3,
                                          color:
                                              Color.fromARGB(255, 43, 42, 42)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Đặt căn chữ vào giữa theo chiều dọc
                                      children: [
                                        Text('Round 7',
                                            style: TextStyle(
                                                color: const Color(0xff355BCA),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23.0)),
                                        Text('Score: ' + man7.toString() + '/5',
                                            style: TextStyle(
                                                color: const Color(0xff355BCA),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.5)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //  Text('số câu hỏi : ${questions.length - 11}'),
                              //man 7
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => cauhoi8(
                                                totalTimer: totalTime,
                                                questions: questions,
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0, top: 0),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    width:
                                        MediaQuery.of(context).size.width / 3.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0)),
                                      border: Border.all(
                                          width: 2.3,
                                          color:
                                              Color.fromARGB(255, 43, 42, 42)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Đặt căn chữ vào giữa theo chiều dọc
                                      children: [
                                        Text('Round 9',
                                            style: TextStyle(
                                                color: const Color(0xff355BCA),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23.0)),
                                        Text('Score: ' + man9.toString() + '/5',
                                            style: TextStyle(
                                                color: const Color(0xff355BCA),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.5)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // man 9
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (man1 >= 3) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => cauhoi1(
                                                    totalTimer: totalTime,
                                                    questions: questions,
                                                  )));
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0, top: 0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      width: MediaQuery.of(context).size.width /
                                          3.3,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(20.0)),
                                        border: Border.all(
                                            width: 2.3,
                                            color: Color.fromARGB(
                                                255, 43, 42, 42)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Đặt căn chữ vào giữa theo chiều dọc
                                        children: [
                                          Text('Round 2',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff355BCA),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23.0)),
                                          Text(
                                              'Score: ' +
                                                  man2.toString() +
                                                  '/5',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff355BCA),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ///////////man 2
                                InkWell(
                                  onTap: () {
                                    if (man3 >= 3) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => cauhoi3(
                                                    totalTimer: totalTime,
                                                    questions: questions,
                                                  )));
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0, top: 0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      width: MediaQuery.of(context).size.width /
                                          3.3,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(20.0)),
                                        border: Border.all(
                                            width: 2.3,
                                            color: Color.fromARGB(
                                                255, 43, 42, 42)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Đặt căn chữ vào giữa theo chiều dọc
                                        children: [
                                          Text('Round 4',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff355BCA),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23.0)),
                                          Text(
                                              'Score: ' +
                                                  man4.toString() +
                                                  '/5',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff355BCA),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ///////////////////man 4
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => cauhoi5(
                                                  totalTimer: totalTime,
                                                  questions: questions,
                                                )));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0, top: 0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      width: MediaQuery.of(context).size.width /
                                          3.3,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(20.0)),
                                        border: Border.all(
                                            width: 2.3,
                                            color: Color.fromARGB(
                                                255, 43, 42, 42)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Đặt căn chữ vào giữa theo chiều dọc
                                        children: [
                                          Text('Round 6',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff355BCA),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23.0)),
                                          Text(
                                              'Score: ' +
                                                  man6.toString() +
                                                  '/5',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff355BCA),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ///////////man 6
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => cauhoi7(
                                                  totalTimer: totalTime,
                                                  questions: questions,
                                                )));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0, top: 0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      width: MediaQuery.of(context).size.width /
                                          3.3,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(20.0)),
                                        border: Border.all(
                                            width: 2.3,
                                            color: Color.fromARGB(
                                                255, 43, 42, 42)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Đặt căn chữ vào giữa theo chiều dọc
                                        children: [
                                          Text('Round 8',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff355BCA),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23.0)),
                                          Text(
                                              'Score: ' +
                                                  man8.toString() +
                                                  '/5',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff355BCA),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ////////////////man 8
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => cauhoi9(
                                                  totalTimer: totalTime,
                                                  questions: questions,
                                                )));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0, top: 0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      width: MediaQuery.of(context).size.width /
                                          3.3,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(20.0)),
                                        border: Border.all(
                                            width: 2.3,
                                            color: Color.fromARGB(
                                                255, 43, 42, 42)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Đặt căn chữ vào giữa theo chiều dọc
                                        children: [
                                          Text('Round 10',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff355BCA),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23.0)),
                                          Text(
                                              'Score: ' +
                                                  man10.toString() +
                                                  '/5',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff355BCA),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                ///////////////man 10000000000000000
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),

            ///////////////////////////////////////////////////////
            ///

            // Padding(
            //   padding: EdgeInsets.only(left: 120),
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => cauhoi(
            //                     totalTimer: 20,
            //                     questions: question,
            //                   )));
            //     },
            //     child: Padding(
            //       padding: EdgeInsets.only(left: 0, top: 0),
            //       child: Container(
            //         height: MediaQuery.of(context).size.height / 8,
            //         width: MediaQuery.of(context).size.width / 3.3,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(20.0),
            //               topRight: Radius.circular(20.0),
            //               bottomRight: Radius.circular(20.0),
            //               bottomLeft: Radius.circular(20.0)),
            //           border: Border.all(
            //               width: 2.3, color: Color.fromARGB(255, 43, 42, 42)),
            //         ),
            //         child: Column(
            //           children: [
            //             Text('Round 2'),
            //             Checkbox(
            //                 checkColor: Colors.white,
            //                 fillColor: MaterialStateProperty.resolveWith(
            //                     (states) => null),
            //                 value: isChecked,
            //                 onChanged: (bool? value) {
            //                   setState(() {});
            //                 }),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ]),
        ),
        //////////////////////////////////////////////

        ////////////////////////////////////////////////////
      ]),
    );
  }
}
