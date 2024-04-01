import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LichSuDau extends StatefulWidget {
  const LichSuDau({super.key});

  @override
  State<LichSuDau> createState() => _LichSuDauState();
}

class _LichSuDauState extends State<LichSuDau> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
    _getdataus();
  }

  String name = '';
  String email = '';
  String _name = '';
  String _email = '';
  int score = 0;
  String ten = '';
  Future _getdata() async {
    await FirebaseFirestore.instance
        .collection('history')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["name"];
          email = snapshot.data()!["email"];
          score = snapshot.data()!["score"];
          ten = snapshot.data()!["ten"];
        });
      }
    });
  }

  Future _getdataus() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          _name = snapshot.data()!["name"];
          _email = snapshot.data()!["email"];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blueGrey,
        // appBar: AppBar(actions: [
        //   // IconButton(onPressed: () {}, icon: Icon(Icons.))
        // ]),

        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bai.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Row(
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
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "History",
                    style: TextStyle(
                      color: const Color(0xff355BCA),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('history')
                          // .orderBy('thoigian', descending: true)
                          .where('email', isEqualTo: _email)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: CircularProgressIndicator(),
                          );

                        final users = snapshot.data!.docs;

                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              color: const Color(0xff355BCA).withOpacity(0.9),
                              child: ListTile(
                                subtitle: Text(
                                  users[index]['thoigian'].toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    //   fontWeight: FontWeight.bold
                                  ),
                                ),
                                title: Text(
                                  users[index]['name'].toString(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                  users[index]['score'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                          itemCount: users.length,
                        );
                      }),
                )
              ],
            )));
  }
}
