import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/textWidget.dart';

class AddCrop extends StatelessWidget {
  late String detail1 = '';
  late String detail2 = '';
  late String detail3 = '';
  late String detail4 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextWidet(
              text: 'Add Crop',
              fw: FontWeight.w300,
              color: Colors.white,
              fontSize: 18.0),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('CROP').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              return Stack(
                children: [
                  ListView.separated(
                      separatorBuilder: ((context, index) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 3,
                          ),
                        );
                      }),
                      itemCount: snapshot.data?.size ?? 0,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(data.docs[index]['imageURL']),
                              const SizedBox(
                                height: 10,
                              ),
                              TextWidet(
                                  text: data.docs[index]['type'],
                                  fw: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 24),
                              const SizedBox(
                                height: 10,
                              ),
                              data.docs[index]['type'] == 'Calabaza'
                                  ? Column(
                                      children: [
                                        GestureDetector(
                                          child: TextWidet(
                                              text: data.docs[index]['detail1'],
                                              fw: FontWeight.normal,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextWidet(
                                            text: data.docs[index]['detail2'],
                                            fw: FontWeight.normal,
                                            color: Colors.grey,
                                            fontSize: 12),
                                      ],
                                    )
                                  : const SizedBox(),
                              data.docs[index]['type'] == 'Eggplant'
                                  ? Column(
                                      children: [
                                        GestureDetector(
                                          child: TextWidet(
                                              text: data.docs[index]['detail1'],
                                              fw: FontWeight.normal,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextWidet(
                                            text: data.docs[index]['detail2'],
                                            fw: FontWeight.normal,
                                            color: Colors.grey,
                                            fontSize: 12),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextWidet(
                                            text: data.docs[index]['detail3'],
                                            fw: FontWeight.normal,
                                            color: Colors.grey,
                                            fontSize: 12),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextWidet(
                                            text: data.docs[index]['detail4'],
                                            fw: FontWeight.normal,
                                            color: Colors.grey,
                                            fontSize: 12),
                                      ],
                                    )
                                  : const SizedBox(),
                              data.docs[index]['type'] == 'Corn'
                                  ? Column(
                                      children: [
                                        GestureDetector(
                                          child: TextWidet(
                                              text: data.docs[index]['detail1'],
                                              fw: FontWeight.normal,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          child: TextWidet(
                                              text: data.docs[index]['detail2'],
                                              fw: FontWeight.normal,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          child: TextWidet(
                                              text: data.docs[index]['detail3'],
                                              fw: FontWeight.normal,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          child: TextWidet(
                                              text: data.docs[index]['detail4'],
                                              fw: FontWeight.normal,
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        );
                      })),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                          child: TextWidet(
                              text: 'Add Crop',
                              fw: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        color: Colors.teal,
                        onPressed: () {}),
                  ),
                ],
              );
            }));
  }
}
