import 'dart:async';
import 'package:crop/logIn/logInPage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoadingScreenToLogIn extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<LoadingScreenToLogIn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      Get.off(() => LogInPage(), transition: Transition.zoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Image(
                      width: 220,
                      image: AssetImage('lib/images/logo.png'),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
