import 'package:crop/home/homePage.dart';
import 'package:crop/profile/profilePage.dart';
import 'package:crop/screens/hotline_page.dart';
import 'package:crop/widgets/textWidget.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

import '../logIn/logInPage.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.teal,
              ),
              accountEmail: TextWidet(
                fw: FontWeight.normal,
                text: box.read('address') ?? '',
                fontSize: 12,
                color: Colors.white,
              ),
              accountName: TextWidet(
                text: "${box.read('firstName')} ${box.read('lastName')}",
                fw: FontWeight.normal,
                fontSize: 18,
                color: Colors.white,
              ),
              currentAccountPicture: const CircleAvatar(
                minRadius: 50,
                maxRadius: 50,
                backgroundImage: AssetImage('lib/images/profile.png'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: TextWidet(
                fw: FontWeight.normal,
                text: 'Home',
                fontSize: 12,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: TextWidet(
                fw: FontWeight.normal,
                text: 'Profile',
                fontSize: 12,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: TextWidet(
                fw: FontWeight.normal,
                text: 'Hotlines',
                fontSize: 12,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HotlinePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: TextWidet(
                fw: FontWeight.normal,
                text: 'Logout',
                fontSize: 12,
                color: Colors.grey,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'Logout Confirmation',
                            style: TextStyle(
                                fontFamily: 'QBold',
                                fontWeight: FontWeight.bold),
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
            ),
            const SizedBox(
              height: 130,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'lib/images/logo.png',
                height: 80,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'All rights reserved.',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
