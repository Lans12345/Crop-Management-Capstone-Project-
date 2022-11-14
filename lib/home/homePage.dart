import 'dart:io';
import 'package:crop/screens/result_page.dart';
import 'package:get/get.dart';
import 'package:crop/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/drawer_widget.dart';

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

  getImageCamera(String imgsrc) async {
    var tempStore = await ImagePicker().getImage(
        source: imgsrc == 'camera' ? ImageSource.camera : ImageSource.gallery);

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
    });
    tts.speak('Image Scanned $name');
    box.write('crop', name);
    await Future.delayed(const Duration(seconds: 5));
    Get.to(const ResultPage());
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
      drawer: const MyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: TextWidet(
            text: 'Home',
            fw: FontWeight.bold,
            color: Colors.white,
            fontSize: 24.0),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isImageLoaded
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 450,
                      width: 330,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(
                                pickedImage,
                              ),
                              fit: BoxFit.cover)),
                    ),
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
              height: 20,
            ),
            TextWidet(
              text: 'Take an Image',
              fw: FontWeight.normal,
              color: Colors.black,
              fontSize: 12.0,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    getImageCamera('camera');
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.camera,
                          color: Colors.black45,
                          size: 28,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidet(
                          text: 'Camera',
                          fw: FontWeight.normal,
                          color: Colors.black45,
                          fontSize: 12.0,
                        ),
                      ],
                    ),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xffCEE5D0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getImageCamera('gallery');
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo,
                          color: Colors.black45,
                          size: 28,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidet(
                          text: 'Gallery',
                          fw: FontWeight.normal,
                          color: Colors.black45,
                          fontSize: 12.0,
                        ),
                      ],
                    ),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xffCEE5D0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}
