import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phan4_bai1/chudechoi/ranking_screen.dart';
import 'package:phan4_bai1/components/bangxephang.dart';
import 'package:phan4_bai1/components/menu.dart';

import 'package:phan4_bai1/components/shopeee.dart';

import 'package:phan4_bai1/components/trangcanhan/trangcanhan.dart';
import 'scerrns/setting.dart';
import 'components/login.dart';
import 'components/sign_up.dart';
import 'components/setting_options.dart';
import 'components/battle_screen.dart';
import 'components/choose_mode.dart';

import 'package:google_fonts/google_fonts.dart';

class homeapp extends StatelessWidget {
  const homeapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đồ án ',
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int score = 0;
  int exp = 0;
  int mony = 0;
  String name = '';
  String email = '';
  int den = 0;
  int tim = 0;
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
  String ten = 'Toán';
  String ten1 = 'Vật Lý';
  String ten2 = 'Hack Não';
  int diem1 = 0;
  int diem2 = 0;
  int diem3 = 0;
  int diem4 = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _updateHighscore();
    _updateshop();
    _updatetoan();
    _updatediemtong();
  }

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
      final lastHighscore = user['email'];

      if (lastHighscore != email) {
        return;
      }
      userRef.update({'email': email});
      return;
    }

    userRef.set({
      'email': authUser.email,
      'mony': mony,
      'exp': exp,
      'score': score,
      'name': "",
      'diemvatly': diem1,
      'diemtoan': diem2,
      'diemhacknao': diem3,
      'diemtong': diem4
    });
  }

  Future<void> _updateshop() async {
    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) return;

    final userRef =
        FirebaseFirestore.instance.collection('shop').doc(authUser.uid);

    final userDoc = await userRef.get();
    if (userDoc.exists) {
      final user = userDoc.data();
      if (user == null) {
        return;
      }
      final lastHighscore = user['email'];

      if (lastHighscore != email) {
        return;
      }
      userRef.update({'email': email});
      return;
    }

    userRef.set({
      'tim': tim,
      'den': den,
    });
  }

  Future<void> _updatetoan() async {
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
      final lastHighscore = user['email'];

      if (lastHighscore != email) {
        return;
      }
      userRef.update({'email': email});
      return;
    }

    userRef.set({
      'man1': man1,
      'man2': man2,
      'man3': man3,
      'man4': man4,
      'man5': man5,
      'man6': man6,
      'man7': man7,
      'man8': man8,
      'man9': man9,
      'man10': man10,
      'tong': 0,
      'ten': ten
    });

    final uservatly =
        FirebaseFirestore.instance.collection('vatly').doc(authUser.uid);

    final userDoc1 = await uservatly.get();
    if (userDoc1.exists) {
      final user = userDoc1.data();
      if (user == null) {
        return;
      }
      final lastHighscore = user['email'];

      if (lastHighscore != email) {
        return;
      }
      uservatly.update({'email': email});
      return;
    }

    uservatly.set({
      'man1': man1,
      'man2': man2,
      'man3': man3,
      'man4': man4,
      'man5': man5,
      'man6': man6,
      'man7': man7,
      'man8': man8,
      'man9': man9,
      'man10': man10,
      'tong': 0,
      'ten': 'Vật Lý'
    });

    final userhacknao =
        FirebaseFirestore.instance.collection('hacknao').doc(authUser.uid);

    final userDoc2 = await userhacknao.get();
    if (userDoc2.exists) {
      final user = userDoc2.data();
      if (user == null) {
        return;
      }
      final lastHighscore = user['email'];

      if (lastHighscore != email) {
        return;
      }
      userhacknao.update({'email': email});
      return;
    }

    userhacknao.set({
      'man1': man1,
      'man2': man2,
      'man3': man3,
      'man4': man4,
      'man5': man5,
      'man6': man6,
      'man7': man7,
      'man8': man8,
      'man9': man9,
      'man10': man10,
      'tong': 0,
      'ten': 'Hack Não'
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text(""),
          //   actions: [
          //     IconButton(
          //       onPressed: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => SettingScreen()));
          //       },
          //       icon: Icon(Icons.settings),
          //       color: Colors.white,
          //     ),
          //   ],
          // ),
          //  drawer: const Menu(),
          bottomNavigationBar: Container(
            color: Color.fromARGB(255, 92, 92, 92),
            child: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.all(4.0),
              splashBorderRadius: BorderRadius.circular(40),
              indicatorColor: Colors.blueGrey,
              tabs: const <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.person_pin),
                ),
                Tab(
                  icon: Icon(Icons.radar_outlined),
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                ),
                Tab(
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Container(
              child: Choose_Mode(),
            ),
            Container(
              child: trangcanhan(),
            ),
            Container(
              child: RankingScreen(),
            ),
            Container(
              child: shoppee(),
            ),
            Container(
              child: SettingScreen(),
            ),
          ]),
        ));
  }
}
