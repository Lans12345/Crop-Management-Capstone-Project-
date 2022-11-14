import 'package:crop/home/homePage.dart';
import 'package:crop/logIn/signUpPage.dart';
import 'package:crop/widgets/imageWidget.dart';
import 'package:crop/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LogInPage extends StatelessWidget {
  late String userName = '';
  late String password = '';
  late String admin = '';

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              ImageWidget(imagePath: 'lib/images/logo.png', width: 180),
              const SizedBox(
                height: 10,
              ),
              TextWidet(
                  text: 'Crop Management\n    Guide System',
                  fw: FontWeight.bold,
                  color: Colors.green[800]!,
                  fontSize: 24),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextFormField(
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Quicksand'),
                  onChanged: (_input) {
                    userName = _input;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'User name',
                    labelStyle: const TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextFormField(
                  obscureText: true,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Quicksand'),
                  onChanged: (_input) {
                    password = _input;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
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
                  if (userName == box.read('userName') &&
                      password == box.read('password')) {
                    Get.off(Home());
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                'Error',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                'Invalid Account',
                                style: TextStyle(fontFamily: 'Quicksand'),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                  child: TextWidet(
                    text: 'Login',
                    fw: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidet(
                      text: 'No Account?',
                      fw: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 12),
                  TextButton(
                    onPressed: () {
                      Get.to(SignUpPage());
                    },
                    child: TextWidet(
                        text: 'Signup now',
                        fw: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              // TextButton(
              //   onPressed: () {
              //     showDialog(
              //         context: context,
              //         builder: (context) => AlertDialog(
              //               title: const Text(
              //                 'Logging in as Admin',
              //                 style: TextStyle(fontFamily: 'Quicksand'),
              //               ),
              //               content: Padding(
              //                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //                 child: TextFormField(
              //                   obscureText: true,
              //                   style: const TextStyle(
              //                       color: Colors.black,
              //                       fontFamily: 'Quicksand'),
              //                   onChanged: (_input) {
              //                     admin = _input;
              //                   },
              //                   decoration: InputDecoration(
              //                     suffixIcon: const Icon(Icons.lock),
              //                     fillColor: Colors.grey[100],
              //                     filled: true,
              //                     enabledBorder: OutlineInputBorder(
              //                       borderSide: const BorderSide(
              //                           width: 1, color: Colors.white),
              //                       borderRadius: BorderRadius.circular(5),
              //                     ),
              //                     focusedBorder: OutlineInputBorder(
              //                       borderSide: const BorderSide(
              //                           width: 1, color: Colors.black),
              //                       borderRadius: BorderRadius.circular(5),
              //                     ),
              //                     labelText: 'Admin Password',
              //                     labelStyle: const TextStyle(
              //                       fontFamily: 'Quicksand',
              //                       color: Colors.black,
              //                       fontSize: 12.0,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               actions: <Widget>[
              //                 FlatButton(
              //                   onPressed: () {
              //                     Navigator.of(context).pop(true);
              //                     if (admin == 'admin123') {
              //                       Get.to(AdminHome());
              //                     } else {
              //                       showDialog(
              //                           context: context,
              //                           builder: (context) => AlertDialog(
              //                                 title: const Text(
              //                                   'Error',
              //                                   style: TextStyle(
              //                                       fontFamily: 'Quicksand'),
              //                                 ),
              //                                 content: const Text(
              //                                   'Invalid Password',
              //                                   style: TextStyle(
              //                                       fontFamily: 'Quicksand'),
              //                                 ),
              //                                 actions: <Widget>[
              //                                   FlatButton(
              //                                     onPressed: () {
              //                                       Navigator.of(context)
              //                                           .pop(true);
              //                                     },
              //                                     child: const Text(
              //                                       'Close',
              //                                       style: TextStyle(
              //                                           fontFamily: 'Quicksand',
              //                                           fontWeight:
              //                                               FontWeight.bold),
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ));
              //                     }
              //                   },
              //                   child: const Text(
              //                     'Continue',
              //                     style: TextStyle(
              //                         fontFamily: 'Quicksand',
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ),
              //                 FlatButton(
              //                   onPressed: () {
              //                     Navigator.of(context).pop(true);
              //                   },
              //                   child: const Text(
              //                     'Close',
              //                     style: TextStyle(
              //                         fontFamily: 'Quicksand',
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ),
              //               ],
              //             ));
              //   },
              //   child: TextWidet(
              //       text: 'Login as Admin',
              //       fw: FontWeight.bold,
              //       color: Colors.teal,
              //       fontSize: 18),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
