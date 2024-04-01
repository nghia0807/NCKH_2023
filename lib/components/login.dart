import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:phan4_bai1/components/quenmk.dart';
import 'package:phan4_bai1/components/sign_up.dart';
import 'package:phan4_bai1/home.dart';
import 'package:phan4_bai1/models/rank_auth_button.dart';

class Login extends StatefulWidget {
  static String tag = 'login-page';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Khong tim thay ten tai khoan hoac email");
      }
    }
    return user;
  }

  @override
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpass = TextEditingController();
  final _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 70),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bai.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 200,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: txtemail,
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
                      padding: EdgeInsets.only(top: 80),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextField(
                          controller: txtpass,
                          obscureText: true,
                          decoration: const InputDecoration(
                            //   icon: Icon(Icons.key),
                            border: OutlineInputBorder(),
                            prefix: Icon(Icons.key),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    child: ElevatedButton(
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: ()
                      // async {
                      //   try {
                      //     final _user = _auth.signInWithEmailAndPassword(
                      //         email: txtemail.text, password: txtpass.text);
                      //    await _auth.authStateChanges().listen((event) {
                      //       if (event != null) {
                      //         txtemail.clear();
                      //         txtpass.clear();
                      //         Navigator.push(
                      //           context,
                      //             MaterialPageRoute(
                      //               builder: (context) => homeapp()));
                      //       } else {
                      //         final snackBar = SnackBar(
                      //             content: Text('Email hoặc mật khẩu không đúng'));
                      //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //       }
                      //     });
                      //   } catch (e) {
                      //     final snackBar =
                      //         SnackBar(content: Text('Lỗi kết nốt database'));
                      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //   }
                      //   // Navigator.push(context,
                      //   //     MaterialPageRoute(builder: (context) => homeapp()));
                      // },
                      async {
                    showDialog(
                        context: context,
                        builder: (context) => Center(
                              child: CircularProgressIndicator(),
                            ));
                    User? user = await loginUsingEmailPassword(
                        email: txtemail.text,
                        password: txtpass.text,
                        context: context);

                    print(user);

                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homeapp(),
                        ),
                      );
                    } else {
                      final snackBar =
                          SnackBar(content: Text('Email does not exist!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff355BCA)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                  ),
                )),
                //      RankAuthButton(),
                Container(
                    child: ElevatedButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff355BCA)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                  ),
                )),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => quenmk()));
                  },
                  child: const Text(
                    'Forgot password',
                    style:
                        TextStyle(fontSize: 15, color: const Color(0xff355BCA)),
                  ),
                ),
              ],
            ))));
  }
}
