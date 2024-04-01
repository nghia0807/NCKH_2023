import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:phan4_bai1/components/lichsudau.dart';
import 'package:phan4_bai1/components/login.dart';
import 'package:phan4_bai1/components/trangcanhan/editprofile.dart';
import 'package:phan4_bai1/models/provider.dart';

class trangcanhan extends StatefulWidget {
  const trangcanhan({Key? key}) : super(key: key);

  @override
  State<trangcanhan> createState() => _trangcanhanState();
}

class _trangcanhanState extends State<trangcanhan> {
  final user = FirebaseAuth.instance.currentUser;
  String name = '';
  String email = '';
  int kn = 0;
  int mony = 0;
  String? image = '';
  int den = 0;
  int tim = 0;
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
          mony = snapshot.data()!["mony"];
          image = snapshot.data()!["photoUrl"];
        });
      }
    });
  }

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

  @override
  void initState() {
    super.initState();
    _getdata();
    _getshop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bai.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 80),
            child: Text('Profile',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  color: const Color(0xff355BCA).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('users')
                                    .snapshots(),
                                builder: ((context, snapshot) {
                                  if (!snapshot.hasData)
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );

                                  final users = snapshot.data!.docs;
                                  return Row(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 90,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage('assets/khung.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Image(
                                          image: AssetImage('assets/1.png'),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Exp:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 22,
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      kn.toString() + ' exp',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          ////////////ten nguoi choi
                          Padding(
                            padding: EdgeInsets.only(left: 60),
                            child: Text(
                              name.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              email.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 75),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                ),
                              ),
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => editprofile(),
                                  ),
                                )
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Edit profile',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                color: const Color(0xff355BCA).withOpacity(0.9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
              ),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, right: 0),
                  child: Text('Items',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Image(
                          image: AssetImage('assets/den.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(den.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Image(
                          image: AssetImage('assets/tien.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(mony.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                    ),
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LichSuDau()))
                    },
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'History',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ]),
            ),
          ),

          ////////nut dang xuat
          Padding(
            padding: EdgeInsets.only(top: 30, left: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  const Color(0xff355BCA),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
              ),
              onPressed: () => {
                FirebaseAuth.instance.signOut(),
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()))
              },
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Log out',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
