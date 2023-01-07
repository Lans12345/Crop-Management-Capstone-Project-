import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/textWidget.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  final box = GetStorage();

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
                            MaterialButton(
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
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('CROP')
                  .where('name', isEqualTo: box.read('crop'))
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print('error');
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('waiting');
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final data = snapshot.requireData;
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(data.docs[0]['pic']),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            TextWidet(
                                text: data.docs[0]['name'],
                                fw: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 32),
                            const SizedBox(
                              width: 20,
                            ),
                            TextWidet(
                                text: data.docs[0]['sci_name'],
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
                            text: data.docs[0]['details'],
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
                            text: data.docs[0]['how_plant'],
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
                            text: data.docs[0]['how_grow'],
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
                                text: "Harvesting",
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
                            text: data.docs[0]['harvest'],
                            fw: FontWeight.normal,
                            color: Colors.grey,
                            fontSize: 14),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            TextWidet(
                                text: "Pest's",
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
                      Image.network(data.docs[0]['pest1']),
                      Image.network(data.docs[0]['pest2']),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
