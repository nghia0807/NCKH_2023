import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phan4_bai1/components/login.dart';

class quenmk extends StatefulWidget {
  const quenmk({super.key});

  @override
  State<quenmk> createState() => _quenmkState();
}

class _quenmkState extends State<quenmk> {
  final _email = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  Future passwordreset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _email.text.trim());
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Text('Check your email to reset your password'),
          );
        }),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xff355BCA)),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bai.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Enter the email address associated with your account",
              textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
            ),
          ),
          MaterialButton(
            onPressed: (() {
              passwordreset();
            }),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold // Set the desired text color
                      // You can set other text properties here such as fontSize, fontWeight, etc.
                      ),
                ),
              ],
            ),
            color: const Color(0xff355BCA),
          )
        ]),
      ),
    );
  }
}
