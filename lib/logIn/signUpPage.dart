import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop/logIn/logInPage.dart';
import 'package:crop/widgets/imageWidget.dart';
import 'package:crop/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String userName = '';

  late String password = '';

  late String firstName = '';

  late String lastName = '';

  late String age = '';

  late String address = '';

  late String gender = 'Male';
  final List<bool> _isSelected = [true, false];

  GetStorage box = GetStorage();

  Future create() async {
    final docUser = FirebaseFirestore.instance.collection('USERS').doc();

    final json = {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'password': password,
      'age': age,
      'gender': gender,
      'address': address,
    };

    await docUser.set(json);
  }

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
            ImageWidget(imagePath: 'lib/images/signUp.png', width: 150),
            const SizedBox(
              height: 20,
            ),
            TextWidet(
                text: 'Login Credentials',
                fw: FontWeight.w300,
                color: Colors.black,
                fontSize: 14),
            const SizedBox(
              height: 10,
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: 'Username',
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
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
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
            TextWidet(
                text: 'User Information',
                fw: FontWeight.w300,
                color: Colors.black,
                fontSize: 14.0),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(
                    color: Colors.black, fontFamily: 'Quicksand'),
                onChanged: (_input) {
                  firstName = _input;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: 'First Name',
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
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(
                    color: Colors.black, fontFamily: 'Quicksand'),
                onChanged: (_input) {
                  lastName = _input;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: 'Last Name',
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
            ToggleButtons(
                borderRadius: BorderRadius.circular(5),
                splashColor: Colors.grey,
                color: Colors.black,
                selectedColor: Colors.blue,
                children: const [
                  Icon(Icons.male),
                  Icon(Icons.female),
                ],
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0; index < _isSelected.length; index++) {
                      if (index == newIndex) {
                        _isSelected[index] = true;
                        if (_isSelected[0] == true) {
                          gender = 'Male';
                        } else {
                          gender = 'Female';
                        }
                      } else {
                        _isSelected[index] = false;
                      }
                    }
                  });
                },
                isSelected: _isSelected),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Colors.black, fontFamily: 'Quicksand'),
                onChanged: (_input) {
                  age = _input;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: 'Age',
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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextFormField(
                minLines: 3,
                maxLines: 3,
                style: const TextStyle(
                    color: Colors.black, fontFamily: 'Quicksand'),
                onChanged: (_input) {
                  address = _input;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: 'Address',
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
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Colors.teal,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'Signup',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold),
                          ),
                          content: const Text(
                            'Account Created Succesfully!',
                            style: TextStyle(fontFamily: 'Quicksand'),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                                box.write('userName', userName);
                                box.write('password', password);
                                box.write('firstName', firstName);
                                box.write('lastName', lastName);
                                box.write('gender', gender);
                                box.write('age', age);
                                box.write('address', address);
                                create();
                                Get.off(LogInPage());
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
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(75, 15, 75, 15),
                child: TextWidet(
                  text: 'Continue',
                  fw: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
