import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Crop extends StatefulWidget {
  const Crop({Key? key}) : super(key: key);

  @override
  State<Crop> createState() => _CropState();
}

class _CropState extends State<Crop> {
  GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    getUrl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getUrl() {
    if (box.read('crop') == 'Corn') {
      return 'https://www.hunker.com/13728343/how-to-grow-corn';
    } else if (box.read('crop') == 'Calabaza') {
      return 'https://www.hunker.com/13406992/how-to-grow-kalabasa-philippine-squash';
    } else {
      return 'https://www.hunker.com/13728271/how-to-grow-eggplant';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('CROP')
                .where('type', isEqualTo: box.read('crop'))
                .snapshots(),
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
              return ListView.builder(
                itemCount: snapshot.data?.size ?? 0,
                itemBuilder: ((context, index) {
                  return Column(
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
                                TextWidet(
                                    text: data.docs[index]['detail1'],
                                    fw: FontWeight.normal,
                                    color: Colors.grey,
                                    fontSize: 12),
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
                                TextWidet(
                                    text: data.docs[index]['detail1'],
                                    fw: FontWeight.normal,
                                    color: Colors.grey,
                                    fontSize: 12),
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
                                TextWidet(
                                    text: data.docs[index]['detail1'],
                                    fw: FontWeight.normal,
                                    color: Colors.grey,
                                    fontSize: 12),
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
                          : Column(
                              children: [
                                TextWidet(
                                    text: data.docs[index]['detail1'],
                                    fw: FontWeight.normal,
                                    color: Colors.grey,
                                    fontSize: 12),
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
                              ],
                            )
                    ],
                  );
                }),
              );
            }),
      ),
    );
  }
}
