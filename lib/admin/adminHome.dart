import 'package:crop/admin/requestPage.dart';
import 'package:crop/logIn/logInPage.dart';
import 'package:crop/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class AdminHome extends StatelessWidget {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: TextWidet(
              text: 'Admin Panel',
              fw: FontWeight.w300,
              color: Colors.white,
              fontSize: 18.0),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: const Text(
                              'You can send a request to the server of this system to add/update a specific plant',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text(
                                  'Close',
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ));
                },
                icon: const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  box.write('adminValue', '1');
                  Get.to(RequestPage());
                },
                child: Container(
                  height: 250,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      image: const DecorationImage(
                          opacity: 130.0,
                          image: AssetImage("lib/images/b1.jpg"),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidet(
                          text: 'Send Request for',
                          fw: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 12.0),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidet(
                          text: 'Add Crop',
                          fw: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 24.0),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  box.write('adminValue', '2');
                  Get.to(RequestPage());
                },
                child: Container(
                  height: 250,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      image: const DecorationImage(
                          opacity: 130.0,
                          image: AssetImage("lib/images/b2.jpg"),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidet(
                          text: 'Send Request for',
                          fw: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 12.0),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidet(
                          text: 'Update Crop Details',
                          fw: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 24.0),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.teal,
                onPressed: () {
                  Get.off(() => LogInPage());
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(75, 15, 75, 15),
                  child: TextWidet(
                    text: 'Logout',
                    fw: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
        ));
  }
}
