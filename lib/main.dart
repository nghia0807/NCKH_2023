import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phan4_bai1/chudechoi/chooseskill.dart';

import 'package:phan4_bai1/components/menu.dart';
import 'package:phan4_bai1/components/quenmk.dart';

import 'package:phan4_bai1/components/shopeee.dart';

import 'package:phan4_bai1/home.dart';
import 'scerrns/setting.dart';
import 'components/login.dart';
import 'components/sign_up.dart';
import 'components/setting_options.dart';
import 'components/battle_screen.dart';
import 'components/choose_mode.dart';

import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Đồ án ',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
