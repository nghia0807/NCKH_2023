import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phan4_bai1/components/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confimpassword = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final name = TextEditingController();
  int score = 0;
  int exp = 0;
  int mony = 0;
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // _updateHighscore();
    super.initState();
  }

  Future signUp() async {
    if (passwordcomfim()) {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }

      //

      //  addUser(email.text.trim(), name.text.trim(), score);
    }
  }

  // Future addUser(
  //   String email,
  //   String name,
  //   int score,
  // ) async {
  //   await FirebaseFirestore.instance.collection('users').doc().update({
  //     'email': email,
  //     'name': name,
  //     'score': score,
  //   });
  // }
  // Future _updata() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .update({
  //     'name': name.text.trim(),
  //     'email': email.text.trim(),
  //     'score': score
  //   });
  // }

  // Future<void> _updateHighscore() async {
  //   final authUser = FirebaseAuth.instance.currentUser;

  //   if (authUser == null) return;

  //   final userRef =
  //       FirebaseFirestore.instance.collection('users').doc(authUser.uid);

  //   final userDoc = await userRef.get();
  //   if (userDoc.exists) {
  //     final user = userDoc.data();
  //     if (user == null) {
  //       return;
  //     }
  //     userRef.update({'name': name.text.trim(), 'email': email.text.trim()});
  //     return;
  //   }

  //   userRef.set({
  //     'email': authUser.email,
  //     'mony': mony,
  //     'exp': exp,
  //     'score': score,
  //     'name': name.text.trim(),
  //   });
  // }

  bool passwordcomfim() {
    if (password.text.trim() == confimpassword.text.trim()) {
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bai.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            SizedBox(height: 150.0),
            const Text(
              "SIGN UP",
              style: TextStyle(
                color: const Color(0xff355BCA),
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
            //   child: TextField(
            //     controller: name,
            //     decoration: InputDecoration(
            //       // icon: Icon(Icons.account_box),
            //       border: OutlineInputBorder(),
            //       labelText: 'Họ và tên',
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  //   icon: Icon(Icons.email),
                  prefix: Icon(Icons.mail),
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  //   icon: Icon(Icons.key),
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.key),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: confimpassword,
                obscureText: true,
                decoration: const InputDecoration(
                  //   icon: Icon(Icons.key),
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.key),
                  labelText: 'Confirm password',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ElevatedButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        signUp();
                        //  _updata();
                        //  _updateHighscore();
                        if (passwordcomfim()) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff355BCA))),
                    )),
              ],
            )
          ]),
        ));
  }
}
