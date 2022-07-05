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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextWidet(
          text: 'Users Profile',
          fw: FontWeight.bold,
          color: Colors.white,
          fontSize: 22.0,
        ),
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
                text: box.read('firstName') + ' ' + box.read('lastName'),
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
                text: box.read('age'),
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
                text: box.read('gender'),
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
                text: box.read('address'),
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
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Colors.teal,
              onPressed: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(75, 15, 75, 15),
                child: TextWidet(
                  text: 'Home',
                  fw: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Colors.teal,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'Confirmation',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold),
                          ),
                          content: const Text(
                            'Are you sure you want to Logout?',
                            style: TextStyle(fontFamily: 'Quicksand'),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                                Get.off(LogInPage());
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(75, 15, 75, 15),
                child: TextWidet(
                  text: 'Logout',
                  fw: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
