import 'package:crop/home/homePage.dart';
import 'package:crop/widgets/drawer_widget.dart';
import 'package:crop/widgets/imageWidget.dart';
import 'package:crop/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../logIn/logInPage.dart';

class ProfilePage extends StatelessWidget {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: TextWidet(
          text: 'Users Profile',
          fw: FontWeight.bold,
          color: Colors.white,
          fontSize: 22.0,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text(
                          'Logout Confirmation',
                          style: TextStyle(
                              fontFamily: 'QBold', fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'Are you sure you want to Logout?',
                          style: TextStyle(fontFamily: 'QRegular'),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                  fontFamily: 'QRegular',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LogInPage()));
                            },
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  fontFamily: 'QRegular',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ));
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ImageWidget(imagePath: 'lib/images/profile.png', width: 120),
            const SizedBox(
              height: 20,
            ),
            TextWidet(
                text: "${box.read('firstName')} ${box.read('lastName')}",
                fw: FontWeight.bold,
                color: Colors.black,
                fontSize: 18),
            const SizedBox(
              height: 5,
            ),
            TextWidet(
                text: 'Full Name',
                fw: FontWeight.w100,
                color: Colors.black,
                fontSize: 12),
            const SizedBox(
              height: 20,
            ),
            TextWidet(
                text: box.read('age') ?? '',
                fw: FontWeight.bold,
                color: Colors.black,
                fontSize: 18),
            const SizedBox(
              height: 5,
            ),
            TextWidet(
                text: 'Age',
                fw: FontWeight.w100,
                color: Colors.black,
                fontSize: 12),
            const SizedBox(
              height: 20,
            ),
            TextWidet(
                text: box.read('gender') ?? '',
                fw: FontWeight.bold,
                color: Colors.black,
                fontSize: 18),
            const SizedBox(
              height: 5,
            ),
            TextWidet(
                text: 'Gender',
                fw: FontWeight.w100,
                color: Colors.black,
                fontSize: 12),
            const SizedBox(
              height: 20,
            ),
            TextWidet(
                text: box.read('address') ?? '',
                fw: FontWeight.bold,
                color: Colors.black,
                fontSize: 18),
            const SizedBox(
              height: 5,
            ),
            TextWidet(
                text: 'Address',
                fw: FontWeight.w100,
                color: Colors.black,
                fontSize: 12),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
