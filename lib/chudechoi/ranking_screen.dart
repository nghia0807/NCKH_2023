import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);
  // final email;
  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
    _getdatadeim();
    _getdatadeim1();
    _getdatadeim2();
  }

  String name = '';
  String email = '';
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
  Future _getdatadeim() async {
    await FirebaseFirestore.instance
        .collection('toan')
        .doc()
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

  int nman1 = 0;
  int nman2 = 0;
  int nman3 = 0;
  int nman4 = 0;
  int nman5 = 0;
  int nman6 = 0;
  int nman7 = 0;
  int nman8 = 0;
  int nman9 = 0;
  int nman10 = 0;
  Future _getdatadeim1() async {
    await FirebaseFirestore.instance
        .collection('hacknao')
        .doc()
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          nman1 = snapshot.data()!["man1"];
          nman2 = snapshot.data()!["man2"];
          nman3 = snapshot.data()!["man3"];
          nman4 = snapshot.data()!["man4"];
          nman5 = snapshot.data()!["man5"];
          nman6 = snapshot.data()!["man6"];
          nman7 = snapshot.data()!["man7"];
          nman8 = snapshot.data()!["man8"];
          nman9 = snapshot.data()!["man9"];
          nman10 = snapshot.data()!["man10"];
        });
      }
    });
  }

  int mman1 = 0;
  int mman2 = 0;
  int mman3 = 0;
  int mman4 = 0;
  int mman5 = 0;
  int mman6 = 0;
  int mman7 = 0;
  int mman8 = 0;
  int mman9 = 0;
  int mman10 = 0;
  Future _getdatadeim2() async {
    await FirebaseFirestore.instance
        .collection('vatly')
        .doc()
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          mman1 = snapshot.data()!["man1"];
          mman2 = snapshot.data()!["man2"];
          mman3 = snapshot.data()!["man3"];
          mman4 = snapshot.data()!["man4"];
          mman5 = snapshot.data()!["man5"];
          mman6 = snapshot.data()!["man6"];
          mman7 = snapshot.data()!["man7"];
          mman8 = snapshot.data()!["man8"];
          mman9 = snapshot.data()!["man9"];
          mman10 = snapshot.data()!["man10"];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 216, 255),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bai.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              'Highest score',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .orderBy('diemtong', descending: true)
                      // .where('email', isEqualTo: email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    final users = snapshot.data!.docs;
                    return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .orderBy('diemtong', descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        final toan = snapshot.data!.docs;
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              color: const Color(0xff355BCA).withOpacity(0.9),
                              child: ListTile(
                                title: Text(
                                  users[index]['name'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing:
                                    Text(toan[index]['diemtong'].toString()),
                              ),
                            );
                          },
                          itemCount: users.length,
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
