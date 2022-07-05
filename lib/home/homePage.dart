import 'dart:io';
import 'package:crop/webview/crop.dart';
import 'package:get/get.dart';
import 'package:crop/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:get_storage/get_storage.dart';
import '../profile/profilePage.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextToSpeech tts = TextToSpeech();
  late String output = '';

  late File pickedImage;

  bool isImageLoaded = false;

  late List result;

  late String accuracy = '';

  late String name = '';

  late String numbers = '';

  GetStorage box = GetStorage();

  getImageCamera() async {
    var tempStore = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      pickedImage = File(tempStore!.path);
      isImageLoaded = true;
      applyModel(File(tempStore.path));
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'lib/model/model_unquant.tflite',
        labels: 'lib/model/labels.txt');
  }

  applyModel(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      result = res!;
      print('result:' + result.toString());
      String str = result[0]['label'];

      name = str.substring(2);
      accuracy = result != null
          ? (result[0]['confidence'] * 100.0).toString().substring(0, 2) + '%'
          : '';
      tts.speak('Image Scanned $name');
      box.write('crop', name);
      Get.to(const Crop());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextWidet(
            text: 'Home Page',
            fw: FontWeight.w300,
            color: Colors.white,
            fontSize: 24.0),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: IconButton(
              onPressed: () {
                Get.off(ProfilePage());
              },
              icon: const Icon(Icons.person),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'List of Crops Available',
                            style: TextStyle(fontFamily: 'Quicksand'),
                          ),
                          content: const Text(
                            'Calabasa, Corn, Eggplant',
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isImageLoaded
              ? Center(
                  child: Container(
                  height: 450,
                  width: 330,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(
                            pickedImage,
                          ),
                          fit: BoxFit.cover)),
                ))
              : SizedBox(
                  height: 350,
                  child: TextWidet(
                      text: 'Select Image',
                      fw: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 18.0),
                ),
          const SizedBox(
            height: 5,
          ),
          TextWidet(
            text: 'Result: $name',
            fw: FontWeight.bold,
            color: Colors.black,
            fontSize: 18.0,
          ),
          const SizedBox(
            height: 10,
          ),
          TextWidet(
            text: 'Accuracy: $accuracy',
            fw: FontWeight.w100,
            color: Colors.black,
            fontSize: 12.0,
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
              getImageCamera();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
              child: TextWidet(
                text: 'Take Picture',
                fw: FontWeight.w300,
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
