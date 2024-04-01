import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramhome.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr1.dart';
import 'package:phan4_bai1/chudechoi/grammar/gramr2.dart';
import 'package:phan4_bai1/models/action_button.dart';
import 'package:phan4_bai1/models/question.dart';

class choilai1 extends StatefulWidget {
  const choilai1({
    Key? key,
    required this.score,
    required this.questions,
    required this.totalTime,
  }) : super(key: key);

  final int score;
  final List<Question> questions;
  final int totalTime;
  @override
  _choilaiState createState() => _choilaiState();
}

class _choilaiState extends State<choilai1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 216, 255),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
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
            Text(
              'Congratulations!  ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Your score: ${widget.score} / 5',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.6, // Đặt độ rộng của container là 60% của chiều rộng màn hình
                  decoration: BoxDecoration(
                    color: Colors.blue, // Màu nền của nút
                    borderRadius:
                        BorderRadius.circular(8.0), // Độ bo tròn viền của nút
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => cauhoi1(
                            totalTimer: widget.totalTime,
                            questions: widget.questions,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Play again',
                      style: TextStyle(
                        color: Colors.white, // Màu chữ của nút
                        fontWeight: FontWeight.bold, // Làm đậm chữ
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Khoảng cách giữa hai nút
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.6, // Đặt độ rộng của container là 60% của chiều rộng màn hình
                  decoration: BoxDecoration(
                    color: Colors.green, // Màu nền của nút
                    borderRadius:
                        BorderRadius.circular(8.0), // Độ bo tròn viền của nút
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => choidon(),
                        ),
                      );
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white, // Màu chữ của nút
                        fontWeight: FontWeight.bold, // Làm đậm chữ
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _updateHighscore();
    _getdata();
    dochistoy();
    _updateman();
    _updateExp();
  }

  Future<void> _updateExp() async {
    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) return;

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(authUser.uid);

    final userDoc = await userRef.get();
    if (userDoc.exists) {
      final user = userDoc.data();
      if (user == null) {
        return;
      }

      final lastHighscore = user['exp'];

      // if (lastHighscore >= widget.score) {
      //   return;
      // }
      userRef.update({'exp': lastHighscore + 10});
      return;
    }

    userRef.set({
      'exp': widget.score,
    });
  }

  Future<void> _updateman() async {
    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) return;

    final userRef =
        FirebaseFirestore.instance.collection('toan').doc(authUser.uid);

    final userDoc = await userRef.get();
    if (userDoc.exists) {
      final user = userDoc.data();
      if (user == null) {
        return;
      }

      final lastHighscore = user['man2'];

      if (lastHighscore >= widget.score) {
        return;
      }
      userRef.update({'man2': widget.score});
      return;
    }

    userRef.set({
      'man2': widget.score,
    });
  }

  // String? _name = '';
  String name = '';
  String email = '';
  int? kn = 0;
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
          kn = snapshot.data()!["exp"];
          image = snapshot.data()!["photoUrl"];
        });
      }
    });
  }

  Future<void> _updateHighscore() async {
    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) return;

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(authUser.uid);

    final userDoc = await userRef.get();
    if (userDoc.exists) {
      final user = userDoc.data();
      if (user == null) {
        return;
      }

      final lastHighscore = user['score'];

      if (lastHighscore >= widget.score) {
        return;
      }
      userRef.update({'score': widget.score});
      return;
    }

    userRef.set({
      'email': authUser.email,
      'photoUrl': authUser.photoURL,
      'score': widget.score,
      'name': authUser.displayName,
    });
  }

  String ten = '';
  Future dochistoy() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["name"];
          email = snapshot.data()!["email"];
        });
      }
    });
    await FirebaseFirestore.instance
        .collection('toan')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          ten = snapshot.data()!["ten"];
          // email = snapshot.data()!["email"];
        });
      }
    });
    await FirebaseFirestore.instance.collection('history').add({
      'email': email,
      'name': name,
      'score': widget.score,
      'ten': ten,
      'thoigian': DateFormat('yyyy-MM-dd KK:mm:ss').format(DateTime.now())
    });
  }
}
