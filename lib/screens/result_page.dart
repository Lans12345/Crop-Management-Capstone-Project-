import 'package:flutter/material.dart';

import '../widgets/textWidget.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: TextWidet(
          text: 'Crop Management',
          fw: FontWeight.bold,
          color: Colors.white,
          fontSize: 18.0,
        ),
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
                            'Make sure you are connected to the Internet',
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
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('lib/images/b1.jpg'),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      TextWidet(
                          text: 'Corn',
                          fw: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 32),
                      const SizedBox(
                        width: 20,
                      ),
                      TextWidet(
                          text: '(Scientific name)',
                          fw: FontWeight.w300,
                          color: Colors.grey,
                          fontSize: 14),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      TextWidet(
                          text: 'Details',
                          fw: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 18),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextWidet(
                      text:
                          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                      fw: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 14),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      TextWidet(
                          text: 'How to plant Corn',
                          fw: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 18),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextWidet(
                      text:
                          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                      fw: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 14),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      TextWidet(
                          text: 'How to grow Corn',
                          fw: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 18),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextWidet(
                      text:
                          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                      fw: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 14),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      TextWidet(
                          text: "Do's and Dont's",
                          fw: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 18),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextWidet(
                      text:
                          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                      fw: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 14),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      TextWidet(
                          text: 'Extra Information',
                          fw: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 14),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.grey,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextWidet(
                      text:
                          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                      fw: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
