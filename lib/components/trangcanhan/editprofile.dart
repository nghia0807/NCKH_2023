import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phan4_bai1/components/trangcanhan/trangcanhan.dart';
import 'package:phan4_bai1/home.dart';

class editprofile extends StatefulWidget {
  const editprofile({
    Key? key,
  });

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  String? name;
  String? email;
  TextEditingController _email = TextEditingController();
  final _name = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getdata();
    // _updata();
  }

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
        });
      }
    });
  }

  Future _updata() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'name': _name.text.trim()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff355BCA),
        title: Padding(
          padding: const EdgeInsets.only(left: 85),
          child: Text('Edit profile'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: 70,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextFormField(
              //   initialValue: email,
              controller: _email,
              decoration: InputDecoration(
                labelText: '$email',
                // icon: Icon(Icons.account_box),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextFormField(
              //  initialValue: name,
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '$name',
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,

              // onSaved: (value) {
              //   name = value;
              // },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: (() {
              // _getdata();

              _updata();
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => homeapp()));
            }),
            child: Text(
              'Save',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            color: const Color(0xff355BCA),
          )
        ],
      ),
    );
  }
}
