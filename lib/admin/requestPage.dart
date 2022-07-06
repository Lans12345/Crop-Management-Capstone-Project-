import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop/admin/adminHome.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/imageWidget.dart';
import '../widgets/textWidget.dart';
import 'package:get/get.dart';

class RequestPage extends StatefulWidget {
  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    req();
  }

  Widget sb(double height) {
    return SizedBox(
      height: height,
    );
  }

  req() {
    if (box.read('adminValue') == '1') {
      return 'Add Crop Request';
    } else {
      return 'Update Crop Details Request';
    }
  }

  title() {
    if (box.read('adminValue') == '1') {
      return 'Name of Crop to Add';
    } else {
      return 'Name of Crop to be Updated';
    }
  }

  late String name = '';
  late String contactNumber = '';
  late String nameOfCrop = '';

  late String reasonOfRequest = '';

  Future create() async {
    final docUser = FirebaseFirestore.instance.collection('REQUEST').doc();

    final json = {
      'Name': name,
      'Type of Request': req(),
      'Contact Number': contactNumber,
      'Reason of Request': reasonOfRequest,
      'Name of Crop': nameOfCrop,
    };

    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: TextWidet(
            text: 'Request Page',
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
                            'Fill up fields to send a request',
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
              sb(20),
              ImageWidget(imagePath: 'lib/images/profile.png', width: 120),
              sb(20),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextFormField(
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Quicksand'),
                  onChanged: (_input) {
                    nameOfCrop = _input;
                  },
                  decoration: InputDecoration(
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
                    labelText: title(),
                    labelStyle: const TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              sb(10),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextFormField(
                  minLines: 3,
                  maxLines: 3,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Quicksand'),
                  onChanged: (_input) {
                    reasonOfRequest = _input;
                  },
                  decoration: InputDecoration(
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
                    labelText: 'State a Reason',
                    labelStyle: const TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              sb(10),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextFormField(
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Quicksand'),
                  onChanged: (_input) {
                    name = _input;
                  },
                  decoration: InputDecoration(
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
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              sb(10),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Quicksand'),
                  onChanged: (_input) {
                    contactNumber = _input;
                  },
                  decoration: InputDecoration(
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
                    labelText: 'Contact Number',
                    labelStyle: const TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              sb(20),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.teal,
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                            title: const Text(
                              'Request Sent!',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            ),
                            content: const Text(
                              'Youre request are send to the system and waiting for confirmation',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                  create();
                                  Get.off(AdminHome());
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
                  padding: const EdgeInsets.fromLTRB(60, 15, 60, 15),
                  child: TextWidet(
                    text: 'Send Request',
                    fw: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              sb(20),
            ],
          ),
        ),
      ),
    );
  }
}
