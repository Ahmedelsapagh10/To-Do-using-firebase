import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist_firebase/view/pages/signinscreen.dart';

import '../../shared_prefrence/sharedPreference.dart';
import 'homeScreen.dart';

class H extends StatefulWidget {
  const H({super.key});

  @override
  State<H> createState() => _HState();
}

class _HState extends State<H> {
  @override
  void initState() {
    getEmail();
    Timer(const Duration(seconds: 1), () {
      user == null
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignInScreen()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/logo3.png')),
    );
  }
}
